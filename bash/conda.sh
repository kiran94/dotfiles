#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

PATH=$PATH:$HOME/miniconda3/bin/
PATH=$PATH:$HOME/.miniconda3/bin/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$USER/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/$USER/.miniconda3/etc/profile.d/conda.sh" ]; then
		. "/home/$USER/.miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/$USER/.miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup




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
