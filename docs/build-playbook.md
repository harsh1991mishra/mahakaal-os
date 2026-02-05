# Build Playbook

This playbook outlines the recommended steps to build Mahakaal OS images using
Kali `live-build`.

## Prerequisites

- Kali or Debian-based build host
- `live-build`, `git`, `curl`, and sufficient disk space

## Workflow

1. **Select profiles**
   - Update package profiles in `profiles/`.
   - Compose the package list:
     ```
     ./scripts/compose-packages.sh --profiles core,privacy,pentest,vm-optimized \
       --output build/config/package-lists/mahakaal.list.chroot
     ```
2. **Configure live-build**
   ```
   cd build
   lb config --mode kali --distribution kali-rolling
   ```
3. **Build the image**
   ```
   lb build
   ```
4. **Post-process**
   - Convert to OVA/VMX for distribution.
   - Generate checksums and GPG signatures.

## Suggested hooks

- Add branding assets (wallpapers, login themes).
- Preseed Clawdbot content into `/opt/clawdbot`.
- Apply VM defaults (guest agents, low-latency settings).
