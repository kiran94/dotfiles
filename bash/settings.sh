export EDITOR=vim
export BROWSER=brave-browser

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

LESS=-JMQRSi

# SSH
# eval "$(ssh-agent -s)" > /dev/null
# [ -f ~/.ssh/*id_rsa ] && ssh-add ~/.ssh/*id_rsa 2> /dev/null
