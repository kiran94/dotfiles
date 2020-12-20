export EDITOR=vim

export PATH=$PATH:/home/kiran/.local/bin

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

# Number of commands help in memory during bash session
HISTSIZE=5000
# History Size
HISTFILESIZE=10000
# Ignore both spaces and duplicates
HISTCONTROL=ignoreboth
# Add DateTime in History
#HISTTIMEFORMAT="%F %T "

# Append to history instead of overwriting, useful for multiple sessions at the same time.
[ "${BASH_VERSINFO:-0}" -ge 4 ] && shopt -s histappend

LESS=-JMQRSi

# SSH
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/*/id_rsa 2> /dev/null

