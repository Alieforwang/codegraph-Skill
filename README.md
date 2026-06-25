# CodeGraph Skill

CodeGraph helps Codex and Claude inspect indexed repositories with symbol lookup, call paths, and project-aware exploration.

## Install

Clone or copy this repo into your skills directory, then restart the assistant you want to use.

```bash
git clone https://github.com/Alieforwang/codegraph-Skill.git ~/.codex/skills/codegraph
```

```powershell
git clone https://github.com/Alieforwang/codegraph-Skill.git $env:USERPROFILE\.codex\skills\codegraph
```

## One-command setup

Use the bootstrap scripts when `codegraph` is not installed yet. They install CodeGraph first, then install this skill for Codex, Claude, or both.

```bash
curl -fsSL https://raw.githubusercontent.com/Alieforwang/codegraph-Skill/main/bootstrap.sh | bash
```

```powershell
irm https://raw.githubusercontent.com/Alieforwang/codegraph-Skill/main/bootstrap.ps1 | iex
```

To target one environment only:

```bash
bash bootstrap.sh --target codex
bash bootstrap.sh --target claude
```

```powershell
.\bootstrap.ps1 -Target codex
.\bootstrap.ps1 -Target claude
```

## Skill install only

Use the install scripts if `codegraph` is already available.

```bash
bash install.sh --target both
```

```powershell
.\install.ps1 -Target both
```

## Use

After install, restart Codex or Claude.

If the project already has a `.codegraph/` index, ask things like:

- Where is `X` defined?
- Who calls `Y`?
- Trace the path from `A` to `B`.
- What files are related to this feature?
