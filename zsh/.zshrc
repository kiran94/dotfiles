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
plug Aloxaf/fzf-tab

#####################
# PROMPT
#####################

[ -f /usr/bin/starship ] && eval "$(starship init zsh)"
[ -f /opt/homebrew/bin/starship ] && eval "$(starship init zsh)"

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
zstyle ':completion:*' menu yes select

# Edit the command on the current prompt
# https://unix.stackexchange.com/a/34251
# https://nuclearsquid.com/writings/edit-long-commands/
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

#####################
# HISTORY OPTIONS
#####################

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt appendhistory
setopt bang_hist
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt NO_hist_beep
setopt NO_share_history

# Update Options
export UPDATE_ZSH_DAYS=7

#####################
# AUTO_NOTIFY
#####################

export AUTO_NOTIFY_THRESHOLD=180 # seconds

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
