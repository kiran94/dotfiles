#!/bin/bash

# Install Packages
apk add bash
apk add neovim
apk add vim
apk add curl
apk add openssl
apk add openssh-client
apk add python3
apk add py-pip

# Add User
adduser kiran -h /home/kiran/ -s /bin/bash/ -D
login -f kiran

## Create SSH Key
mkdir ~/.ssh && cd ~/.ssh
ssh-keygen -t ed25519 -f github_id_ed25519
