#!/bin/bash

# Prompts
# Built using https://scriptim.github.io/bash-prompt-generator/

PS1='\[\e[0;2;38;5;75m\]\t\[\e[m\] \[\e[0;38;5;87m\]\u\[\e[m\] \[\e[0;2m\]\h\[\e[m\] \[\e[0;1;38;5;184m\]\w\[\e[m\] \[\e[0;1;38;5;70m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[m\] \[\e[0;38;5;178m\][\[\e[0;38;5;184m\]\j\[\e[0;38;5;178m\]]\[\e[m\] \[\e[0m\]\$\[\e[m\]\n\[\e0'

# Additional Configuration
[ -f $HOME/.config/bash/aliases.sh ] && source $HOME/.config/bash/aliases.sh
[ -f $HOME/.config/bash/bindings.sh ] && source $HOME/.config/bash/bindings.sh
[ -f $HOME/.config/bash/settings.sh ] && source $HOME/.config/bash/settings.sh
[ -f $HOME/.config/bash/database.sh ] && source $HOME/.config/bash/database.sh
[ -f $HOME/.config/bash/application.sh ] && source $HOME/.config/bash/application.sh
[ -f $HOME/.config/bash/services.sh ] && source $HOME/.config/bash/services.sh
[ -f $HOME/.config/bash/conda.sh ] && source $HOME/.config/bash/conda.sh

# Work
[ -f ~/.config/work.sh ] && source ~/.config/work.sh

# Secrets
[ -f ~/.config/secrets.sh ] && source ~/.config/secrets.sh

# Attach to a tmux session else create it
tmux attach || tmux new-session -s main
