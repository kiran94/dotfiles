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

eval "$(starship init zsh)"

# Enable Vim Mode
bindkey '^R' history-incremental-search-backward

# Remap JQ completion helper
bindkey '^j' jq-complete

# Highlight selection when tab completing
zstyle ':completion:*' menu select

HIST_IGNORE_DUPS=true
HIST_IGNORE_ALL_DUPS=true
HIST_IGNORE_SPACE=true

export UPDATE_ZSH_DAYS=7
