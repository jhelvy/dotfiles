---
name: jp-command
description: Scaffold a new custom zsh shell command into the user's dotfiles "jp" command collection. Use when the user asks to add, create, or modify a personal shell command/function — especially one that needs to change the current shell's state (cd, set env vars), which must be a sourced function rather than a PATH script.
---

# jp-command: Add a custom shell command to the dotfiles collection

The user keeps a collection of personal zsh commands as one sourced function per file. This skill adds a new one.

## How the collection works

- **Source dir:** `~/gh/dotfiles/zsh/jp/` — one `*.zsh` file per command, each defining a single zsh function.
- **Symlink:** `~/.config/jp` → `~/gh/dotfiles/zsh/jp/` (already set up).
- **Loader:** `~/.zshrc` sources every file in the symlinked dir:
  ```zsh
  for f in ~/.config/jp/*.zsh(N); do source "$f"; done
  ```
- **Result:** dropping a new `*.zsh` file in the dir auto-loads it in the next shell. No `.zshrc` edits needed per command.

## Key constraint — sourced function vs PATH script

A command that must change the **current shell's** state (`cd`, export env vars, set shell options) **must be a sourced shell function**, like these are. A standalone executable on `PATH` runs in a subshell and physically cannot alter its parent shell — so it cannot `cd` you anywhere. Always implement these as functions in this collection, never as `bin/` scripts.

## Steps to add a command

1. Confirm the command name and what it should do. Naming is the user's choice — they don't have to follow a `jp-` prefix (e.g. the yazi command is just `yy`).
2. Create `~/gh/dotfiles/zsh/jp/<name>.zsh` defining a single function named `<name>`:
   ```zsh
   # <name> — one-line description of what it does
   <name>() {
     # implementation; use `local` for temp vars, `builtin cd` to change dir
   }
   ```
3. Keep the file to one function. Add a short top comment explaining usage.
4. Tell the user to reload (`source ~/.zshrc` or open a new terminal) to pick it up, then test it.
5. Remind the user to `git push` the dotfiles repo so it syncs to other machines. **Never run git yourself** — the user always commits.

## Reference: the `yy` command (yazi → cd)

`~/gh/dotfiles/zsh/jp/yy.zsh` — launches yazi, then cds the shell to wherever yazi was when you quit (`q` writes the dir, `Q` quits without changing it):

```zsh
# yy — launch yazi, then cd the shell to the directory you quit in.
yy() {
  local tmp cwd
  tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
```
