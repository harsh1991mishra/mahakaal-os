# VM Defaults Checklist

Use this checklist to apply VM-friendly defaults during image creation or first
boot provisioning.

## System tuning

- Set the CPU governor to `performance` inside VMs.
- Enable TRIM for virtual disks.
- Use lightweight compositor settings.

## Services

- Enable guest agents and clipboard sharing when safe.
- Disable Bluetooth, cups, and other non-essential services by default.

## Networking

- Default to NAT or host-only networks.
- Provide a clear toggle for bridged networking with warnings.

## User experience

- Add a welcome screen reminding users about lab-only usage.
- Ship a default non-root user and require sudo for admin tasks.
