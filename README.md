# dotfiles

Personal configuration files and Claude Code settings.

## Structure

```
dotfiles/
├── claude/
│   └── settings.json         # Claude Code global permissions — symlink to ~/.claude/settings.json
├── skills/
│   └── <skill-name>/
│       └── SKILL.md          # Instructions Claude reads for different tasks
├── zsh/
│   └── jp/
│       └── <name>.zsh        # Personal zsh commands — symlinked to ~/.config/jp, sourced by ~/.zshrc
├── CLAUDE.md                 # Global Claude Code instructions — symlink to ~/.claude/CLAUDE.md
└── README.md
```

## New machine setup

```bash
git clone git@github.com:jhelvy/dotfiles.git ~/gh/dotfiles
```

Then run these one-time symlinks:

```bash
# Global Claude Code instructions and permissions
mkdir -p ~/.claude
ln -s ~/gh/dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/gh/dotfiles/claude/settings.json ~/.claude/settings.json
ln -s ~/gh/dotfiles/claude/skills ~/.claude/skills
ln -s ~/gh/dotfiles/claude/commands ~/.claude/commands
ln -s ~/gh/dotfiles/claude/contexts ~/.claude/contexts
ln -s ~/gh/dotfiles/claude/hooks ~/.claude/hooks
ln -s ~/gh/dotfiles/claude/rules ~/.claude/rules
ln -s ~/gh/dotfiles/claude/agents ~/.claude/agents
```

That's all you need globally. Skills are loaded dynamically from the GitHub repo (with
local fallback), so no further setup is required for them.

> **Note:** Symlink at the file level (not the directory level) so that Claude Code can
> still write its own files (e.g. `projects/`, `todos/`, `statsig/`) into `~/.claude/`
> without those showing up in this repo.

## Per-project setup

For per-project permissions, copy `claude/settings.json` into the project's `.claude/`
folder and adjust as needed.

Claude Code auto-adds `settings.local.json` to `.gitignore`, so it won't be accidentally
committed to your project repos — which is intentional, since permissions are personal.

## Adding new skills

Create a new folder under `skills/` with a `SKILL.md` inside, push to GitHub, and
Claude will discover it automatically on the next session. No changes to `CLAUDE.md`
needed.

## Shell commands (`zsh/jp/`)

Personal zsh commands live as one sourced function per file in `zsh/jp/`. The whole
directory is symlinked to `~/.config/jp`, and `~/.zshrc` sources every file in it:

```zsh
for f in ~/.config/jp/*.zsh(N); do source "$f"; done
```

One-time symlink on a new machine:

```bash
mkdir -p ~/.config
ln -s ~/gh/dotfiles/zsh/jp ~/.config/jp
```

Then add the loader line above to `~/.zshrc`.

**Adding a command:** drop a new `zsh/jp/<name>.zsh` defining a single function
`<name>()`, then `git push`. It auto-loads in the next shell — no `.zshrc` edits.
Names are free-form (no required prefix).

> **Why functions, not scripts:** anything that must change the current shell's
> state (`cd`, env vars) has to be a *sourced function*. A standalone script on
> `PATH` runs in a subshell and can't alter its parent shell. The `jp-command`
> Claude skill scaffolds these for you.

Current commands:

- `yy` — launch yazi, then `cd` to the directory you quit in (`q` to cd, `Q` to skip).

## What lives here vs. what doesn't

| File | In dotfiles? | Notes |
|------|-------------|-------|
| `CLAUDE.md` | ✅ Yes | Global instructions, fully portable |
| `claude/settings.json` | ✅ Yes | Global permissions, symlinked to `~/.claude/` |
| `skills/` | ✅ Yes | Reusable skill definitions |
| Project-level `settings.local.json` | ❌ No | Copied (not symlinked) per project as needed |
| Project-level `CLAUDE.md` | ❌ No | Stays inside each individual project repo |

## Verify symlinks are working

```bash
ls -la ~/.claude/CLAUDE.md
ls -la ~/.claude/settings.json
```

Both should show `->` pointing back to `~/gh/dotfiles/`.
