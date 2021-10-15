#!/bin/bash

sudo pacman -S vim tmux git
sudo pacman -S neovim
sudo pacman -S tree
sudo pacman -S htop
sudo pacman -S fzf ripgrep jq
sudo pacman -S npm yarn
sudo pacman -S alacritty
sudo pacman -S github-cli
sudo pacman -S python-pip

sudo yay -S gnome-shell-extension-pop-shell-git
sudo yay -S brave-browser
sudo yay -S expressvpn
sudo yay -S neofetch
sudo yay -S pgcli

# Vim Plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \\n       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'\n

# Tmux Plugins
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Yarn Installs
yarn global add tldr
yarn global add gitignore.cli

# Zsh Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Docker
sudo pacman -S docker
sudo systemctl enable docker
sudo systemctl start docker
usermod --append --groups docker kiran # Require Log in/out
