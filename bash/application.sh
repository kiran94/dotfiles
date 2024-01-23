#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# Path
export PATH=$PATH:$HOME/.dotnet/tools/
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.nix-profile/bin
export PATH=$PATH:$HOME/.nvs/node/19.5.0/x64/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin
export PATH=$PATH:$HOME/dotnet-previews
export PATH=$PATH:/usr/local/bin/spark/bin/
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin # macOS
export GOPATH=$HOME/Documents/projects/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

export ASPNETCORE_ENVIRONMENT=Development
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_NOLOGO=1
export PYSPARK_DRIVER_PYTHON=ptpython

function spark_start
{
    spark_master_start
    spark_worker_start
    jps
}

function spark_stop
{
    spark_master_stop
    spark_worker_stop
    sleep 1
    jps
}

#######################################
## Python Version Manager
#
# NOTE:
# Use fpyenv to install a version
# pyenv versions
# pyenv local <version>
#######################################

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH=$PATH:$PYENV_ROOT/bin
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#
# if command -v pyenv 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
# fi

#######################################
## Node Version Manager
#######################################

export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

# Rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
