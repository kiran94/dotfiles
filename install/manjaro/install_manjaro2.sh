#!/bin/bash

# SHELL
sudo pacman -S zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting starship
yay -S oh-my-zsh-git
chsh -l # List available shells
sudo chsh -s /bin/zsh # Change default shell

# EDITOR
pacman -S vim neovim
yay -S nvim-packer-git

# GRAPHICAL INTERFACE
pacman -S xf86-video-intel \
    xorg xorg-xinit \
    arandr \
    bspwm sxhkd \
    picom \
    redshift \
    lxsession \
    feh \
    polybar \
    xclip


# OTHER
sudo pacman -S locate gparted mpd unzip fzf ripgrep


# SERVICES
systemctl start mpd
systemctl enable mpd


# TODO: DOCUMENT THESE
yay -S powerline-console-fonts
sudo pacman -S libnotify
yay -S deadd-notification-center
sudo pacman -S brightnessctl
sudo yay -S betterlockscreen
sudo pacman -S nautilus
sudo pacman -S pipewire pipewire-pulse
yay -S bluetooth-autoconnect
sudo pacman -S pamixer
sudo pacman -S rofi
