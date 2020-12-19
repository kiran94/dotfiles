#!/bin/bash

# Prompts
# Built using https://scriptim.github.io/bash-prompt-generator/

PS1='\[\e[0;2;38;5;75m\]\t\[\e[m\] \[\e[0;38;5;87m\]\u\[\e[m\] \[\e[0;2m\]\h\[\e[m\] \[\e[0;1;38;5;184m\]\w\[\e[m\] \[\e[0;1;38;5;70m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[m\] \[\e[0;38;5;178m\][\[\e[0;38;5;184m\]\j\[\e[0;38;5;178m\]]\[\e[m\] \[\e[0m\]\$\[\e[m\]\n\[\e0'

# Exports
export EDITOR=vim

# Alias
source $HOME/.config/bash/aliases.sh

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
