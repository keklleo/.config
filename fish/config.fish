if status is-interactive
    # vi key binds
    set -g fish_key_bindings fish_vi_key_bindings
    # accept completion with ctrl-y
    bind --mode insert \cy forward-char
    # aliases
    test -e "$XDG_CONFIG_HOME/aliasrc" && \
      source $XDG_CONFIG_HOME/aliasrc
end
