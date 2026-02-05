# Modular Package Framework

Mahakaal OS uses a lightweight profile system to make it easy to add or remove packages. Each profile is a simple list of packages with optional metadata. Build scripts translate profiles into `live-build` package lists.

## Profile format

Profiles live in `profiles/` and use a YAML-like format for clarity.

```
# profiles/privacy.yaml
name: privacy
summary: Privacy-first browsing and communications
packages:
  - torbrowser-launcher
  - openvpn
  - wireguard
  - network-manager-openvpn
  - network-manager-wireguard
  - gnupg
  - veracrypt
  - cryptsetup
  - dnscrypt-proxy
  - mat2
```

## Available profiles

- **core**: base Kali packages and required utilities.
- **privacy**: Tor Browser, VPNs, encryption, metadata tools.
- **pentest**: curated Kali toolsets for exercises.
- **vm-optimized**: guest tools, virtualization drivers, lightweight defaults.

## Usage

1. Add or remove packages from the profiles.
2. Use the helper script to compose the build lists.
3. Rebuild the image using `live-build`.

```
./scripts/build-image.sh --profiles core,privacy,pentest,vm-optimized
```

The build script merges the selected profile package lists into `config/package-lists/mahakaal.list.chroot` so `lb build` installs the desired packages.
