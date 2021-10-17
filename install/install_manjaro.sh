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
sudo pacman -S redis
sudo pacman -S mpv
sudo pacman -S net-tools
sudo pacman -S terraform
sudo pacman -S starship

sudo yay -S gnome-shell-extension-pop-shell-git
sudo yay -S brave-browser
sudo yay -S expressvpn
sudo yay -S neofetch
sudo yay -S pgcli
sudo yay -S ani-cli-git
sudo yay -S ptpython

# https://wiki.manjaro.org/index.php/Power_Management
sudo yay -S tlp
sudo yay -S tlpui

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
sudo pacman -S docker docker-compose
sudo systemctl enable docker
sudo systemctl start docker
usermod --append --groups docker kiran # requires log in/out

# Services
systemctl enable redis
systemctl status redis

# Sound
# generatel sound worked out the box
# but this step was required to get it
# working with mpv player
# https://forums.debian.net//viewtopic.php?t=123902
echo "options snd_hda_intel index=1" >> /etc/modprobe.d/default.conf

# Postgres
# https://wiki.archlinux.org/title/PostgreSQL#Installation
sudo pacman -S postgresql
sudo -iu postgres initdb -D /var/lib/postgres/data/
sudo -iu postgres createuser --createdb --login --createrole --superuser kiran # or createuser --interactive
sudo systemctl start postgresql
sudo -u postgres psql -c "ALTER USER kiran PASSWORD 'your-password';"
# Give root admin as password on both db and os
sudo passwd postgres
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'your-password';"
