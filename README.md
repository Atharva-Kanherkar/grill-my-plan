# grill-my-plan

A Codex skill for stress-testing technical plans before they harden into implementation.

It pushes on a plan one decision at a time, checks the local codebase first, then calibrates the choice against strong outside evidence: respected open-source codebases, official docs, engineering blogs, talks, papers, and community consensus. The point is not to blindly copy "best practice"; it is to make the trade-off clear enough that you can choose it on purpose.

## Install

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/Atharva-Kanherkar/grill-my-plan.git ~/.codex/skills/grill-my-plan
```

Or download the repo zip from GitHub and place the extracted `grill-my-plan` folder in:

```text
~/.codex/skills/
```

## Use

Ask Codex:

```text
Use $grill-my-plan to stress-test this architecture plan against my codebase and outside engineering evidence.
```

## What It Does

- grills one unresolved decision at a time
- inspects your repo before asking questions
- compares options against real-world engineering precedent
- explains when to copy, adapt, or reject outside patterns
- makes the accepted trade-off explicit
- captures docs only when useful, not as busywork

## License

MIT
