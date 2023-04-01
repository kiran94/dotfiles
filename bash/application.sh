#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# Path
export PATH=$PATH:$HOME/.dotnet/tools/
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.nix-profile/bin
export PATH=$PATH:/usr/local/bin/spark/bin/
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin # macOS
export PATH=$HOME/dotnet-previews:$PATH
export GOPATH=$HOME/Documents/projects/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

export ASPNETCORE_ENVIRONMENT=Development
export ASPNETCORE_Kestrel__Certificates__Default__Path=~/.certificates/localhost.pfx
export ASPNETCORE_Kestrel__Certificates__Default__Password=Password123
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

## Pyenv

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

## Node Version Manager

export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"


# Rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
