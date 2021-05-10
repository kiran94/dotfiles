#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install vim
sudo apt install neovim
sudo apt install tmux
sudo apt install curl
sudo apt install tree
sudo apt install htop
sudo apt install openssh-client
sudo apt install python3
sudo apt install python3-pip
sudo apt install git
sudo apt install apt-transport-https
sudo apt install nodejs npm
sudo apt install net-tools

############################# Additional Extras

# Performance boost most used applications
sudo apt install preload
# Media codecs
sudo apt install ubuntu-restricted-extras

#####
# ssh-keygen -t ed25519 -f ~/.ssh/github_id_ed25519

############################# Browser

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y
sudo apt install brave-browser
sudo apt purge firefox

############################# Developer Tools

sudo add-apt-repository ppa:aslatter/ppa
sudo apt install alacritty
sudo npm install -g tldr
sudo npm install -g gitignore.cli
# Tmux Plugins
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Nvim Plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#############################

# Install Fonts
sudo apt install fonts-cascadia-code
sudo fc-cache -f -v

#############################

sudo snap install spotify
sudo snap install unsplashed-wallpapers

#############################

# Pop OS Desktop Manager
sudo add-apt-repository ppa:system76/pop
sudo apt install pop-desktop


############################# VPN

curl https://www.expressvpn.works/clients/linux/expressvpn_3.7.0.29-1_amd64.deb -O
dpkg --install expressvpn_3.7.0.29-1_amd64.deb
rm expressvpn_3.7.0.29-1_amd64.deb

#############################
#############################

# CLEAN UP
# Some of these technologies come from desktop managers
# and I don't need

sudo apt purge firefox
sudo apt purge arandr
sudo apt purge catfish
sudo apt purge celluloid
sudo apt purge cheese
sudo apt purge aisleriot
sudo apt purge gnome-2048
sudo apt purge magnus
sudo apt purge libreoffice*
sudo apt purge gnome-maps
sudo apt purge gnome-sudoku
sudo apt purge transmission*
sudo apt purge rhyt*
sudo apt purge preview*
sudo apt purge Mahjongg
sudo apt purge onboard*
sudo apt purge drawing*

sudo apt autoremove
