source $HOME/.bashrc

#####################
# ZAP
#####################

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug zsh-users/zsh-syntax-highlighting
plug zsh-users/zsh-autosuggestions
plug zsh-users/zsh-completions
plug ael-code/zsh-colored-man-pages
plug agkozak/zsh-z
plug MichaelAquilina/zsh-auto-notify

#####################
# PROMPT
#####################

[ -f /usr/bin/starship ] && eval "$(starship init zsh)"

#####################
# SETTINGS
#####################

# Enable Vim Mode
bindkey '^R' history-incremental-search-backward

# Remap JQ completion helper
bindkey '^j' jq-complete

# Load and initialise completion system
autoload -Uz compinit
compinit

# Highlight selection when tab completing
zstyle ':completion:*' menu select

# Edit the command on the current prompt
# https://unix.stackexchange.com/a/34251
# https://nuclearsquid.com/writings/edit-long-commands/
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# History Options
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

# Update Options
export UPDATE_ZSH_DAYS=7

# Ignore these commands for long-running notifications
export AUTO_NOTIFY_IGNORE=(
    'vim'
    'nvim'
    'less'
    'more'
    'cat'
    'bat'
    'man'
    'tig'
    'watch'
    'git add'
    'git commit'
    'git diff'
    'top'
    'htop'
    'ssh'
    'nano'
    'jupyter',
    "fg",
    "vd",
    "ipython",
    "poetry shell",
    "gh gist edit",
)
