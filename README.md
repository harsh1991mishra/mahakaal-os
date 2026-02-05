# Mahakaal OS

Mahakaal OS is a custom Kali Linux-based distribution focused on privacy-first
cybersecurity training in safe, virtualized environments. This repository
provides the blueprint, package profiles, and documentation needed to build and
customize the distribution.

## Goals

- Ship privacy tooling by default (Tor Browser, VPN clients, encryption
  utilities).
- Provide a modular framework for adding or removing package bundles quickly.
- Include the Clawdbot assistant to guide users through hands-on cybersecurity
  exercises.
- Offer documentation and tutorials on ethical penetration testing and secure
  system administration.
- Optimize the system for virtual machines to enable safe experimentation.

## Repository layout

- `docs/` — Architecture, blueprints, tutorials, and VM optimization guidance.
- `profiles/` — Package profiles used by the modular framework.
- `scripts/` — Build and image composition helpers (reference implementations).
- `clawdbot/` — Assistant design notes and exercise content.

## Quick start

1. Review the blueprint and VM optimization notes.
2. Customize package profiles in `profiles/`.
3. Use `scripts/build-image.sh` as a starting point for building a Kali live
   image with `live-build`.
4. Extend Clawdbot with new exercises in `clawdbot/exercises/`.

> Note: The scripts are reference implementations meant to be adapted to your
> build environment and CI/CD setup.

## Documentation index

- [Blueprint](docs/blueprint.md)
- [Build playbook](docs/build-playbook.md)
- [Modular framework](docs/modular-framework.md)
- [Clawdbot assistant](docs/clawdbot.md)
- [Clawdbot implementation](docs/clawdbot-implementation.md)
- [VM optimization](docs/vm-optimization.md)
- [VM defaults checklist](docs/vm-defaults.md)
- Tutorials
  - [Ethical penetration testing](docs/tutorials/ethical-pentest.md)
  - [Secure system administration](docs/tutorials/secure-admin.md)
