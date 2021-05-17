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
sudo apt install fzf
sudo apt install ripgrep
sudo apt install transmission-cli
sudo apt install vlc
sudo apt install xclip
sudo apt install flameshot
sudo apt install jq

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
# .NET
wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0

rm packages-microsoft-prod.deb


# Github Cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh

# Docker
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Add your user to the docker group
# to allow running commands
# without sudo
sudo gpasswd -a $USER docker
sudo newgrp docker

# Docker Compose
# Note the version is hardcoded
# and there might be a new one
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

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

# Trust bluetooth headset for autoconnect
# https://techwiser.com/fix-bluetooth-device-doesnt-auto-connect-in-linux/
# bluetoothctl trust <mac_address>

#############################

sudo add-apt-repository ppa:fingerprint/fingerprint-gui
sudo apt update
sudo apt upgrade
sudo apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui

############################# Starship Prompt

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

############################# Find Keys
sudo apt install xbindkeys
xbindkeys --defaults > /home/kiran/.xbindkeysrc
xbindkeys --multikey

sudo gem install neovim
sudo npm install -g neovim
sudo apt install ruby-dev
sudo apt install cpanminus

sudo cpanm -n Neovim::Ext

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
sudo apt purge gnome-screenshot

sudo apt autoremove
