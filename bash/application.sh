# Path
PATH=$PATH:$HOME/.dotnet/tools/
PATH=$PATH:$HOME/go/bin/

# ASP.NET
export ASPNETCORE_ENVIRONMENT=Development
[ -f /mnt/c/Users/$USER/.aspnet/https/aspnetapp.pfx ]; export ASPNETCORE_Kestrel__Certificates__Default__Path=/mnt/c/Users/$USER/.aspnet/https/aspnetapp.pfx

