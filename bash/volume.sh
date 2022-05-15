#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# https://unix.stackexchange.com/a/21090
alias volume0="amixer set Master 0%"
alias volume25="amixer set Master 25%"
alias volume50="amixer set Master 50%"
alias volume75="amixer set Master 75%"
alias volume100="amixer set Master 100%"

alias brightness_increase="xbacklight -inc 10"
alias brightness_decrease="xbacklight -dec 10"
