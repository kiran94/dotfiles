#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# Prompts
# Built using https://scriptim.github.io/bash-prompt-generator/

if [ $SHELL = "/usr/bin/bash" ];
then
    PS1='\[\e[0;2;38;5;75m\]\t\[\e[m\] \[\e[0;38;5;87m\]\u\[\e[m\] \[\e[0;2m\]\h\[\e[m\] \[\e[0;1;38;5;184m\]\w\[\e[m\] \[\e[0;1;38;5;70m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[m\] \[\e[0;38;5;178m\][\[\e[0;38;5;184m\]\j\[\e[0;38;5;178m\]]\[\e[m\] \[\e[0m\]\$\[\e[m\]\n\[\e0'
fi

# Additional Configuration
[ -f $HOME/.config/bash/aliases.sh ] && source $HOME/.config/bash/aliases.sh
[ -f $HOME/.config/bash/bindings.sh ] && source $HOME/.config/bash/bindings.sh
[ -f $HOME/.config/bash/settings.sh ] && source $HOME/.config/bash/settings.sh
[ -f $HOME/.config/bash/database.sh ] && source $HOME/.config/bash/database.sh
[ -f $HOME/.config/bash/application.sh ] && source $HOME/.config/bash/application.sh
[ -f $HOME/.config/bash/services.sh ] && source $HOME/.config/bash/services.sh
[ -f $HOME/.config/bash/conda.sh ] && source $HOME/.config/bash/conda.sh
[ -f $HOME/.config/bash/completions.sh ] && source $HOME/.config/bash/completions.sh
[ -f $HOME/.config/bash/utilities.sh ] && source $HOME/.config/bash/utilities.sh
[ -f $HOME/.config/bash/volume.sh ] && source $HOME/.config/bash/volume.sh

# Work
[ -f ~/.config/work.sh ] && source ~/.config/work.sh

# Secrets
[ -f ~/.config/secrets.sh ] && source ~/.config/secrets.sh

# Attach to a tmux session else create it
# Don't if already in Tmux
# DOn't if inside a program like vscode
[ -z "${TMUX}" ] && [ -z "${TERM_PROGRAM}" ] && (tmux attach || tmux new-session -s main)

# Budgie added this
if [ $TILIX_ID ] || [ $VTE_VERSION ] ; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END

################################

# Starship Prompt
# https://starship.rs/
[ -f /usr/local/bin/starship ] && [ $SHELL = "/usr/bin/bash" ] && eval "$(starship init bash)"

# Neofetch
[ -z "${TERM_PROGRAM}" ] && [ -f /usr/bin/neofetch ] && neofetch

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/kiran/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/kiran/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/kiran/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/kiran/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
