# XDG
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"

# Rust
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
fish_add_path "$CARGO_HOME/bin"

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
