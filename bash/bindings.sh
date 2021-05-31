#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# Forward and Backwards Partial Search
[ "${BASH_VERSINFO:-0}" -ge 4 ] && bind '"\e[A": history-search-backward'
[ "${BASH_VERSINFO:-0}" -ge 4 ] && bind '"\e[B": history-search-forward'

# Disable default suspend from ctrl-s and ctrl-q
[ "${BASH_VERSINFO:-0}" -ge 4 ] && stty -ixon

# Type directory name to cd
[ "${BASH_VERSINFO:-0}" -ge 4 ] && shopt -s autocd

