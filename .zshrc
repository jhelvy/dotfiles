
. "$HOME/.local/bin/env"

[[ -f "\/Users/jhelvy/.config/kaku/zsh/kaku.zsh" ]] && source "\/Users/jhelvy/.config/kaku/zsh/kaku.zsh" # Kaku Shell Integration

function yy() {
  local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}