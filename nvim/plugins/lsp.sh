#!/bin/bash

npm i -g pyright
npm i -g bash-language-server
npm i -g vim-language-server
npm i -g vscode-html-languageserver-bin
npm i -g sql-language-server
npm i -g typescript typescript-language-server
npm i -g dockerfile-language-server-nodejs
npm i -g vscode-css-languageserver-bin
npm i -g vscode-json-languageserver
npm i -g vls

# Terraform
curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# OmniSharp
curl https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.37.10/omnisharp-linux-x64.tar.gz -O --location
tar xvf omnisharp-linux-x64.tar.gz
sudo mv omnisharp /usr/local/bin
