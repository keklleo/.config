# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# No annoying sound
unsetopt beep

# Auto CD
setopt autocd

# Keybindings
bindkey -v
bindkey "^Y" autosuggest-accept

# History 
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=$ZDOTDIR/histfile
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completion styling
# TODO: Fix completion somehow bc it doesnt work
# zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:lower:]}{[:upper:]}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Load completions
autoload -U compinit && compinit

# Fancy colors
[ -e "$XDG_CONFIG_HOME/dircolors" ] && \
  eval "$(dircolors $XDG_CONFIG_HOME/dircolors)"

# Aliases
[ -e "$XDG_CONFIG_HOME/aliasrc" ] && \
  source $XDG_CONFIG_HOME/aliasrc

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
