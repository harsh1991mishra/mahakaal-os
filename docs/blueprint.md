# Mahakaal OS Blueprint

This blueprint describes how to create a Kali Linux derivative that emphasizes privacy tooling, modular package management, and a guided learning experience via the Clawdbot assistant.

## Base system

- **Base distro:** Kali Linux (current rolling release).
- **Build tooling:** `live-build` with a custom config tree.
- **Target:** Virtual machine images (OVA/VMX) and live ISO.

## Default privacy toolchain

Mahakaal OS installs these tools by default:

- **Tor Browser** (privacy-preserving web access)
- **VPN clients** (OpenVPN + WireGuard)
- **Encryption utilities** (GnuPG, VeraCrypt, LUKS tooling, `cryptsetup`)
- **Secure DNS tooling** (DNSCrypt-proxy, optional DoH resolvers)
- **Metadata scrubbing** (`mat2` or `exiftool`)

## Security posture

- Enforce non-root usage for daily workflows.
- Hardened defaults for SSH and system services.
- System-wide firewall enabled by default (UFW or nftables profile).
- Logging tuned for training scenarios while avoiding sensitive data retention.

## Release artifacts

- **Live ISO** for testing and lab use.
- **Virtual appliance** for VMware/VirtualBox/Proxmox.
- Optional **cloud image** for lab automation.

## Build pipeline overview

1. **Profile selection**: Choose package profiles from `profiles/` (core, privacy, pentest, vm-optimized).
2. **Live-build config**: Generate `config/package-lists/*.list.chroot` from the selected profiles.
3. **Image build**: Run `lb build` with custom hooks for branding and defaults.
4. **Post-process**: Convert to OVA/VMX, include checksum, sign release artifacts.

Refer to `scripts/build-image.sh` for a starting point.
