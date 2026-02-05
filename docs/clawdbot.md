# Clawdbot Assistant

Clawdbot is a built-in assistant that guides users through cybersecurity exercises, providing step-by-step hints, safety warnings, and contextual explanations.

## Design goals

- Offer safe, ethical guidance for lab-only penetration testing.
- Provide modular exercise packs aligned with the tutorial curriculum.
- Encourage documentation and reporting of findings.
- Work offline with local documentation bundles.

## User experience

- Launch with `clawdbot` from the terminal or desktop shortcut.
- Choose a learning path (network scanning, web app testing, blue-team hardening).
- Receive structured tasks, hints, and checkpoints.
- Export a run log for instructor review.

## Exercise packs

Exercise packs live in `clawdbot/exercises/` and include metadata for difficulty, prerequisites, and safe lab requirements.

```
name: Intro to Recon
difficulty: beginner
requires:
  - local-lab
steps:
  - "Identify the target IP range in the lab network"
  - "Run a safe discovery scan using nmap"
  - "Summarize results in the exercise log"
```

## Integration points

- Uses the tutorial content in `docs/tutorials/` for background reading.
- References the modular package profiles to ensure tools are available.
- Logs outputs to `~/Mahakaal-Logs/` by default.
