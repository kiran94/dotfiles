#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"


# https://wiki.archlinux.org/title/Xbindkeys#Backlight_control
alias volume_increase="pactl set-sink-volume @DEFAULT_SINK@ +1000"
alias volume_decrease="pactl set-sink-volume @DEFAULT_SINK@ -1000"

alias brightness_increase="xbacklight -inc 10"
alias brightness_decrease="xbacklight -dec 10"
