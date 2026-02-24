# dotfiles

Personal configuration files and Claude Code settings.

## Structure

```
dotfiles/
├── .claude/
│   └── settings.local.json   # Claude Code permissions — copy/symlink to .claude/ in any project
├── skills/
│   └── data-analysis/
│       └── SKILL.md          # Instructions Claude reads before data analysis tasks
├── CLAUDE.md                 # Global Claude Code instructions — symlink to ~/.claude/CLAUDE.md
└── README.md
```

## New machine setup

```bash
git clone git@github.com:jhelvy/dotfiles.git ~/gh/dotfiles
```

Then run these one-time symlinks:

```bash
# 1. Global Claude Code instructions (applies to every project)
mkdir -p ~/.claude
ln -s ~/gh/dotfiles/CLAUDE.md ~/.claude/CLAUDE.md
```

That's all you need globally. Skills are loaded dynamically from the GitHub repo (with
local fallback), so no further setup is required for them.

## Per-project setup

Symlink the local settings file into any project you want Claude Code to have
pre-approved permissions in:

```bash
mkdir -p /path/to/your/project/.claude
ln -s ~/gh/dotfiles/.claude/settings.local.json /path/to/your/project/.claude/settings.local.json
```

Note: Claude Code auto-adds `settings.local.json` to `.gitignore`, so it won't be
accidentally committed — which is intentional.

## Adding new skills

Create a new folder under `skills/` with a `SKILL.md` inside, push to GitHub, and
Claude will discover it automatically on the next session. No changes to `CLAUDE.md`
needed.
