#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

export EDITOR=vim
export BROWSER=brave-browser
export LESS=-JMQRSi

# XDG standard environment variables
# https://github.com/adrg/xdg#default-locations
export XDG_DATA_HOME=~/.local/share
export XDG_DATA_DIRS=/usr/local/share
export XDG_CONFIG_HOME=~/.config
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=~/.cache

export XDG_DESKTOP_DIR=~/Desktop
export XDG_DOWNLOAD_DIR=~/Downloads
export XDG_DOCUMENTS_DIR=~/Documents
export XDG_MUSIC_DIR=~/Music
export XDG_PICTURES_DIR=~/Pictures
export XDG_VIDEOS_DIR=~/Videos
export XDG_TEMPLATES_DIR=~/Templates
export XDG_PUBLICSHARE_DIR=~/Public

export DOTFILESSYNC_CONFIG=$HOME/.config/dotfiles/dotfiles-sync.json
export DOTFILESSYNC_DIR=$HOME/.config/dotfiles

# Number of commands help in memory during bash session
HISTSIZE=5000
# History Size
HISTFILESIZE=1000000
# Ignore both spaces and duplicates
HISTCONTROL=ignoreboth
# Add DateTime in History
#HISTTIMEFORMAT="%F %T "

# Append to history instead of overwriting, useful for multiple sessions at the same time.
[ "${BASH_VERSINFO:-0}" -ge 4 ] && shopt -s histappend

# Case insensitive tab completion
[ "${BASH_VERSINFO:-0}" -ge 4 ] && bind 'set completion-ignore-case on'
[ "${BASH_VERSINFO:-0}" -ge 4 ] && shopt -s cdspell
[ "${BASH_VERSINFO:-0}" -ge 4 ] && complete -d cd
[ "${BASH_VERSINFO:-0}" -ge 4 ] && shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# # make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# SSH
# eval "$(ssh-agent -s)" > /dev/null
# [ -f ~/.ssh/*id_rsa ] && ssh-add ~/.ssh/*id_rsa 2> /dev/null

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
