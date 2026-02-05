# VM Optimization Guide

Mahakaal OS is designed for safe experimentation in virtual machines. Apply the following defaults during image build or first boot.

## Performance defaults

- Enable guest tools: `open-vm-tools`, `spice-vdagent`, `qemu-guest-agent`.
- Use lightweight desktop defaults (XFCE or minimal GNOME session).
- Disable heavyweight background services not required for labs.
- Set I/O scheduler to `none` or `mq-deadline` for virtual disks.

## Security defaults

- Snapshot-friendly logging configuration.
- Default firewall enabled.
- Host-only networking profiles for lab isolation.
- Preconfigured lab user with non-root privileges.

## Image settings

- Thin-provisioned disks with trim enabled.
- Pre-configured shared folder mount points (disabled by default).
- Seeded Kali repo mirror list for faster package updates.

## Lab isolation checklist

- Use host-only or NAT networking by default.
- Provide a toggle to enable bridged networking only for advanced users.
- Include warnings in Clawdbot and the welcome screen.
