source $HOME/.bashrc
source ~/.config/dotfiles/zsh/antigen.zsh

antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle agkozak/zsh-z
antigen bundle reegnz/jq-zsh-plugin

antigen apply

[ -f /usr/bin/starship ] && eval "$(starship init zsh)"

# Enable Vim Mode
bindkey '^R' history-incremental-search-backward

# Remap JQ completion helper
bindkey '^j' jq-complete

# Highlight selection when tab completing
zstyle ':completion:*' menu select

# Edit the command on the current prompt
# https://unix.stackexchange.com/a/34251
# https://nuclearsquid.com/writings/edit-long-commands/
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# History Options
HIST_IGNORE_DUPS=true
HIST_IGNORE_ALL_DUPS=true
HIST_IGNORE_SPACE=true

# Update Options
export UPDATE_ZSH_DAYS=7
