#!/bin/bash

# Zsh Plugins
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Docker
sudo pacman -S docker docker-compose
sudo systemctl enable docker
sudo systemctl start docker
usermod --append --groups docker kiran # requires log in/out

# Services
systemctl enable redis
systemctl status redis

# Sound
# generally sound worked out the box
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

# Visidata
yay -S visidata
# for parquet support
# these need to be installed globally
python -m pip install pandas pyarrow

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

# Music Player Daemon
sudo pacman -Ss extra/mpd
sudo systemctl status mpd
sudo systemctl enable mpd


# https://unix.stackexchange.com/a/149883
# https://bbs.archlinux.org/viewtopic.php?id=240023
yay -S xss-lock
sudo pacman -S slock


sudo pacman -S lxsession
sudo pacman -S redshift
sudo pacman -S pulseaudio-bluetooth
sudo pacman -S noto-fonts-emoji




