#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# Path
export PATH=$PATH:$HOME/.dotnet/tools/
export PATH=$PATH:$HOME/go/bin/
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin # macOS
export PATH=$PATH:/usr/local/bin/spark/bin/

# ASP.NET
export ASPNETCORE_ENVIRONMENT=Development
[ -f /mnt/c/Users/$USER/.aspnet/https/aspnetapp.pfx ]; export ASPNETCORE_Kestrel__Certificates__Default__Path=/mnt/c/Users/$USER/.aspnet/https/aspnetapp.pfx

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export PYSPARK_DRIVER_PYTHON=ptpython
