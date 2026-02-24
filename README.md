# dotfiles

Personal configuration files and settings.

## Structure

```
dotfiles/
├── .claude/
│   └── settings.local.json   # Claude Code permissions — copy to .claude/ in any project
├── skills/
│   └── data-analysis/
│       └── SKILL.md          # Instructions Claude reads before data analysis tasks
└── README.md
```

## Usage

### Claude Code settings

Copy `.claude/settings.local.json` into the root of any project:

```bash
cp ~/dotfiles/.claude/settings.local.json /path/to/your/project/.claude/settings.local.json
```

Or symlink it (so changes to your dotfiles propagate automatically):

```bash
mkdir -p /path/to/your/project/.claude
ln -s ~/dotfiles/.claude/settings.local.json /path/to/your/project/.claude/settings.local.json
```

Note: Claude Code auto-adds `settings.local.json` to `.gitignore`, so this file won't be committed to your project — which is intentional.

### Skills

Point Claude at a skill by referencing the path in your prompt or system instructions:

> "Before starting, read ~/dotfiles/skills/data-analysis/SKILL.md and follow those conventions."

## New machine setup

```bash
git clone git@github.com:yourname/dotfiles.git ~/dotfiles
```

Then symlink or copy configs as needed per project.
