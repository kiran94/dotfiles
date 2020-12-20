# Forward and Backwards Partial Search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Disable default suspend from ctrl-s and ctrl-q
stty -ixon

# Type directory name to cd
shopt -s autocd
