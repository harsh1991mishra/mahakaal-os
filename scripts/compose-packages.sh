#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: compose-packages.sh --profiles core,privacy,pentest,vm-optimized --output <path>

Merges Mahakaal OS profiles into a live-build package list. Supports comments
and basic validation (missing profiles, empty package lists, duplicates).
USAGE
}

profiles=""
output=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profiles)
      profiles="$2"
      shift 2
      ;;
    --output)
      output="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$profiles" || -z "$output" ]]; then
  echo "Profiles and output are required." >&2
  usage
  exit 1
fi

IFS="," read -r -a selected_profiles <<< "$profiles"

mkdir -p "$(dirname "$output")"
: > "$output"

declare -A seen_packages

for profile in "${selected_profiles[@]}"; do
  profile_file="profiles/${profile}.yaml"
  if [[ ! -f "$profile_file" ]]; then
    echo "Missing profile: $profile_file" >&2
    exit 1
  fi

  echo "# ${profile}" >> "$output"
  packages=$(awk '/^  - /{print $2}' "$profile_file")
  if [[ -z "$packages" ]]; then
    echo "Profile has no packages: $profile_file" >&2
    exit 1
  fi

  while IFS= read -r package; do
    if [[ -n "${seen_packages[$package]:-}" ]]; then
      echo "# (duplicate) ${package}" >> "$output"
    else
      echo "$package" >> "$output"
      seen_packages[$package]=1
    fi
  done <<< "$packages"

  echo "" >> "$output"
  echo "Added profile: $profile"
done

echo "Generated package list at $output"
