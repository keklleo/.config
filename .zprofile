# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# PATH
PATH_EXTEND=(
  "$HOME/.local/bin" 
  "$XDG_DATA_HOME/bin"
  "$XDG_DATA_HOME/cargo/bin"
  "/usr/local/texlive/2024/bin/x86_64-linux"
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

# IPYTHON
export IPYTHONDIR="$XDG_CACHE_HOME/ipython"
