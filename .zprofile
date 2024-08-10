# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/tmp/$USER"

# PATH
PATH_EXTEND=(
  "$HOME/.local/bin" 
  "$XDG_DATA_HOME/bin"
  "$XDG_DATA_HOME/texlive/2021/bin/x86_64-linux"
  "$XDG_DATA_HOME/cargo/bin"
  "$XDG_DATA_HOME/sumneko_lua/bin"
)

PATH_TEMP=$PATH
for p in "${PATH_EXTEND[@]}"; do
    PATH_TEMP="$p:$PATH_TEMP"
done

export PATH=$PATH_TEMP

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# LESS
export LESSHISTFILE="$XDG_CACHE_HOME/lesshist"

# NVM
export NVM_DIR="$XDG_DATA_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NODE
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"

# RUST
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
