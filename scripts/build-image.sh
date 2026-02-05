#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: build-image.sh --profiles core,privacy,pentest,vm-optimized

Builds a Mahakaal OS Kali live image using live-build. This script is a
reference implementation and should be adapted to your environment.
USAGE
}

profiles=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profiles)
      profiles="$2"
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

if [[ -z "$profiles" ]]; then
  echo "No profiles supplied." >&2
  usage
  exit 1
fi

workdir="$(pwd)/build"
config_dir="$workdir/config"
list_dir="$config_dir/package-lists"

rm -rf "$workdir"
mkdir -p "$list_dir"

merged_list="$list_dir/mahakaal.list.chroot"

./scripts/compose-packages.sh --profiles "$profiles" --output "$merged_list"

echo ""
echo "Next steps:"
echo "  cd $workdir"
echo "  lb config --mode kali --distribution kali-rolling"
echo "  lb build"
