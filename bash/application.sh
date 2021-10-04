#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# Path
export PATH=$PATH:$HOME/.dotnet/tools/
export PATH=$PATH:$HOME/go/bin/
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:/usr/local/bin/spark/bin/
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin # macOS
export PATH=$HOME/dotnet-previews:$PATH

export ASPNETCORE_ENVIRONMENT=Development
export ASPNETCORE_Kestrel__Certificates__Default__Path=~/.certificates/localhost.pfx
export ASPNETCORE_Kestrel__Certificates__Default__Password=Password123
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_NOLOGO=1
export PYSPARK_DRIVER_PYTHON=ptpython
export GOBIN=$HOME/go/bin
