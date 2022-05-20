source $HOME/.bashrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
[ -d /home/$USER/.oh-my-zsh ] && export ZSH="/home/$USER/.oh-my-zsh"
[ -d /usr/share/oh-my-zsh/ ] && export ZSH="/usr/share/oh-my-zsh/"

# Themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Starship
eval "$(starship init zsh)"

# Powerlevel
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# ZSH_THEME="powerlevel10k/powerlevel10k"
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z command-not-found colored-man-pages)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # pacman
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh         # pacman

# Enable Vim Mode
# bindkey -v
bindkey '^R' history-incremental-search-backward

HIST_IGNORE_DUPS=true
HIST_IGNORE_ALL_DUPS=true
HIST_IGNORE_SPACE=true

export UPDATE_ZSH_DAYS=7
