#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

alias cls=clear

# alias log="git log --format=oneline --graph"
# https://stackoverflow.com/a/9463536/2558542
# https://stackoverflow.com/questions/7736781/how-to-make-git-log-not-prompt-to-continue
alias log='git --no-pager log --pretty=format:"%C(yellow)%h %C(red)%an %C(magenta)%ad %C(blue)%s" --date=relative --graph'

alias v="nvim"
alias ..="cd .."

alias g="git"
alias gs='git status'
alias gpull='git pull'

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
alias debug="cgdb"
alias csharp='csharprepl'
alias tf='terraform'
alias his='history | fzf'
alias f='fzf'

export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export PYSPARK_PYTHON=/usr/bin/python3
alias spark_master_start=/opt/spark/sbin/start-master.sh
alias spark_master_stop=/opt/spark/sbin/stop-master.sh
alias spark_worker_start="/opt/spark/sbin/start-worker.sh spark://pop-os.localdomain:7077 --cores 2 --memory 2G"
alias spark_worker_stop=/opt/spark/sbin/stop-worker.sh


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
