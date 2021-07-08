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
npm i -g yaml-language-server

python -m pip install 'python-language-server[all]'
python -m pip install pyls-mypy
python -m pip install pyls-isort

# Terraform
curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

curl https://github.com/hashicorp/terraform-ls/releases/download/v0.19.0/terraform-ls_0.19.0_linux_amd64.zip -O --location
unzip terraform-ls_0.19.0_linux_amd64.zip
sudo mv terraform-ls /usr/local/bin
rm terraform-ls_0.19.0_linux_amd64.zip 

# OmniSharp
curl https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.37.10/omnisharp-linux-x64.tar.gz -O --location
tar xvf omnisharp-linux-x64.tar.gz
sudo mv omnisharp /usr/local/bin

# Go Lang
GO111MODULE=on go get golang.org/x/tools/gopls@latest
go get golang.org/x/tools/cmd/goimports

# JavaScript / TypeScript / Json / GraphQL / YAML / Markdown
npm i -g prettier


