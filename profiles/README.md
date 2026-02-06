# Package Profiles

Profiles define the bundle of packages included in a Mahakaal OS build. Each
profile file is a simple YAML-style list that the build scripts translate into
`live-build` package lists.

## Conventions

- Keep each profile focused on a single intent (privacy, pentest, VM drivers).
- Add new packages under the `packages:` key with a `-` prefix.
- Prefer Kali meta-packages when possible to keep maintenance low.

## Example

```
name: privacy
summary: Privacy-first browsing and communications
packages:
  - torbrowser-launcher
  - openvpn
  - wireguard
```

## Tips

- If you remove a package, re-run `scripts/compose-packages.sh` before building.
- Validate the list in a disposable VM before publishing a new image.
