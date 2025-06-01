# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

if status is-interactive
  # no greeting
  set -g fish_greeting
  # vi key binds
  set -g fish_key_bindings fish_vi_key_bindings
  # accept completion with ctrl-y
  bind --mode insert \cy forward-char
  # aliases
  test -e "$XDG_CONFIG_HOME/aliasrc" && \
    source $XDG_CONFIG_HOME/aliasrc
end
