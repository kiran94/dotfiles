#!/bin/bash

alias cls=clear
alias log="git log --format=oneline --graph"
alias debug="cgdb"
alias v="vim"
alias ..="cd .."
alias g="git"

alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ccat='highlight --out-format=ansi'
alias vd='visidata'
alias rediscli=iredis
alias md='python -m rich.markdown'
alias python='python3'
alias ds='dotfiles sync'
alias py='ptpython'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
