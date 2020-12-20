EDITOR=vim

# Number of commands help in memory during bash session
HISTSIZE=5000
# History Size
HISTFILESIZE=10000
# Ignore both spaces and duplicates
HISTCONTROL=ignoreboth
# Add DateTime in History
#HISTTIMEFORMAT="%F %T "

# Append to history instead of overwriting, useful for multiple sessions at the same time.
shopt -s histappend

LESS=-JMQRSi

# SSH
eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/*/id_rsa 2> /dev/null

