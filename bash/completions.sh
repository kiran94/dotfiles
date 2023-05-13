#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# Bash
[ -n "$BASH_VERSION" ] && eval "$(gh completion -s bash)"

# Zsh
# [ -n "$ZSH_VERSION" ] && eval "$(gh completion -s zsh)"
