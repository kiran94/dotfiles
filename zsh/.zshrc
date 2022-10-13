source $HOME/.bashrc
source ~/.config/dotfiles/zsh/antigen.zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle agkozak/zsh-z

antigen apply

eval "$(starship init zsh)"

# Enable Vim Mode
bindkey '^R' history-incremental-search-backward

HIST_IGNORE_DUPS=true
HIST_IGNORE_ALL_DUPS=true
HIST_IGNORE_SPACE=true

zstyle ':completion:*' menu select

export UPDATE_ZSH_DAYS=7
