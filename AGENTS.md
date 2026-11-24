# AGENTS.md

itexists is one agent skill, shipped two ways: the skills CLI (`npx skills add`) and a Claude Code plugin.

## Layout

- `skills/itexists/SKILL.md`: the skill. The only copy; both install paths read it.
- `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json`: the plugin and its marketplace.
- `docs/examples.md`: real runs, copied as printed.
- `scripts/check.sh`: the CI gate.
- `docs/BRAND.md`: maintainer notes, git-ignored. Read it when present.

## Gate

Run `scripts/check.sh` before every commit. It runs `claude plugin validate .` and fails on any em dash in tracked markdown.

## Rules

- Keep one `SKILL.md`. Never add a second copy.
- `SKILL.md` stays short: every line is read on every run. Cut before you add.
- The description sentence is identical in `README.md`, `plugin.json` and `marketplace.json`.
- No numeric claims about time or tokens saved. Examples are real runs only, never written by hand.
- No em dashes in any markdown file.
- Test a `SKILL.md` change with `claude --plugin-dir .` on a whole-app idea and on a feature inside a project.
