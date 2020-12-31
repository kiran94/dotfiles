# Path
PATH=$PATH:$HOME/.dotnet/tools/
export PATH=$PATH:$HOME/go/bin/
export PATH=$PATH:/home/kiran/.local/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.9/bin # macOS 

# ASP.NET
export ASPNETCORE_ENVIRONMENT=Development
[ -f /mnt/c/Users/$USER/.aspnet/https/aspnetapp.pfx ]; export ASPNETCORE_Kestrel__Certificates__Default__Path=/mnt/c/Users/$USER/.aspnet/https/aspnetapp.pfx

