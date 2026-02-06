# Clawdbot Implementation Notes

These notes describe how to implement Clawdbot as a local assistant packaged
inside Mahakaal OS.

## Runtime approach

- Ship a small CLI wrapper (`/usr/local/bin/clawdbot`).
- Store exercise packs in `/opt/clawdbot/exercises`.
- Read `clawdbot/manifest.yaml` for module metadata.
- Log session outputs to `~/Mahakaal-Logs`.

## Suggested CLI flow

1. Load manifest and list modules.
2. Prompt the user for a module and exercise.
3. Render steps, hints, and safety warnings.
4. Write a summary log for instructor review.

## Packaging checklist

- Copy `clawdbot/` content into `/opt/clawdbot` during build.
- Add a desktop launcher for the CLI.
- Ensure exercises reference tutorial docs bundled in `/usr/share/doc/mahakaal-os/`.
