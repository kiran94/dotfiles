#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

alias cls=clear

# alias log="git log --format=oneline --graph"
# https://stackoverflow.com/a/9463536/2558542
# https://stackoverflow.com/questions/7736781/how-to-make-git-log-not-prompt-to-continue
# https://stackoverflow.com/a/39249439/2558542
# alias log='git --no-pager log --graph --pretty=format:"%C(yellow)%h %C(red)%an %C(magenta)%ad %C(blue)%s %C(red)%d" --date=relative'
alias log='git --no-pager log --graph --pretty=format:"%C(yellow)%h %<(10,trunc) %C(red)%an %<(15,trunc) %ad %C(blue)%s %C(yellow)%d" --date=relative'
alias flog='log | fzf'

alias v="nvim"
alias ..="cd .."

alias g="git"
alias gs='git status'
alias gp='git push'
alias gpull='git pull'

alias ls='ls -h --color=auto'
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
alias cgdb="cgdb -q"
alias gdb="gdb -q"
alias debug="cgdb"
alias csharp='csharprepl'
alias tf='terraform'
alias system='inxi -Fxzc0'
alias notepad="nvim -c 'set wrap linebreak spell norelativenumber'"
alias copy="xclip -selection clipboard"
alias OLDPWD='cd $OLDPWD'

[ -f /usr/bin/batcat ] && alias bat='batcat'
[ -f /usr/bin/fdfind ] && alias fd='fdfind'

[ -x "$(command -v expressvpn)" ] && alias vpn='expressvpn status'
[ -x "$(command -v hyperfine)" ] && alias hf='hyperfine'
[ -x "$(command -v lsd)" ] && alias ls='lsd'

# Fuzzy
alias f='fzf | xargs nvim'
alias fhistory='history | fzf'
alias fenv='env | fzf'
alias fdotfiles="find ~/.config/dotfiles -type f| grep -v '.git' | fzf | xargs nvim"
alias co='git checkout $(git branch | fzf)'
alias fpyenv='pyenv install -v $(pyenv install --list | rg "\s+[0-9\.]+(-dev)?$" | sort | tac | fzf)'
alias gist='gh gist edit $(gh gist list | fzf | awk "{print $1}")'

export SPARK_HOME=/opt/spark
export SPARK_HOST="spark://$(hostname):7077"
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export PYSPARK_PYTHON=/usr/bin/python3
alias spark_master_start=$SPARK_HOME/sbin/start-master.sh
alias spark_master_stop=$SPARK_HOME/sbin/stop-master.sh
alias spark_worker_start="$SPARK_HOME/sbin/start-worker.sh $SPARK_HOST --cores 2 --memory 2G"
alias spark_worker_stop=$SPARK_HOME/sbin/stop-worker.sh

alias bluetooth=blueberry
alias wifi=nm-connection-editor

alias todo="gh gist edit b0c78a6039b826da81dad0d81021626c"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
