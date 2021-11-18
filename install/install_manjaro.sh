#!/bin/bash

sudo pacman -Syu
sudo pacman -S vim tmux git
sudo pacman -S neovim
sudo pacman -S tree
sudo pacman -S htop
sudo pacman -S fzf ripgrep jq
sudo pacman -S npm yarn
sudo pacman -S alacritty
sudo pacman -S github-cli
sudo pacman -S python-pip
sudo pacman -S python-pipenv
sudo pacman -S redis
sudo pacman -S mpv
sudo pacman -S net-tools
sudo pacman -S terraform
sudo pacman -S starship
sudo pacman -S bluez-utils
sudo pacman -S ranger
sudo pacman -S speedtest-cli

yay -Syu
yay -S gnome-shell-extension-pop-shell-git
yay -S brave-browser
yay -S expressvpn
yay -S neofetch
yay -S pgcli
yay -S ani-cli-git
yay -S ptpython

# https://wiki.manjaro.org/index.php/Power_Management
sudo yay -S tlp
sudo yay -S tlpui
# OR
sudo yay -S laptop-mode-tools
sudo systemctl enable --now laptop-mode.service

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

# Remove Gnome Packages
sudo pacman -R lollypop
sudo pacman -R geary
sudo pacman -R gnome-maps

# Visidata
yay -S visidata
# for parquet support
# these need to be installed globally
python -m pip install pandas
python -m pip install pyarrow

# Apache Spark
sudo pacman -S jre11-openjdk-headless jdk11-openjdk

cd ~/Downloads
curl https://dlcdn.apache.org/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz -o ~/Downloads/
mkdir spark
tar xvf spark-3.2.0-bin-hadoop3.2.tgz --directory spark
cd spark
sudo mv spark-3.2.0-bin-hadoop3.2 /opt/spark

# my alias to start
# get hostname from ui
# http://localhost:8080
spark_master_start
spark_worker_start
jps

cp $SPARK_HOME/conf/log4j.properties.template $SPARK_HOME/conf/log4j.properties
sed -i 's/INFO/WARN/' $SPARK_HOME/conf/log4j.properties

# Run Spark client and attach to host
pyspark --master $SPARK_HOST
