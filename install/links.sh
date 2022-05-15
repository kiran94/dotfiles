#!/bin/bash

DOTFILESSYNC_CONFIG="${DOTFILESSYNC_CONFIG:-$HOME/.config/dotfiles/dotfiles-sync.json}"
DOTFILESSYNC_DIR="${DOTFILESSYNC_DIR:-$HOME/.config/dotfiles}"

# BASH
rm -i ~/.bashrc
ln -vnsf $DOTFILESSYNC_DIR/bash/.bashrc ~/.bashrc
ln -vnsf $DOTFILESSYNC_DIR/bash ~/.config/bash
ln -vnsf $DOTFILESSYNC_DIR/bash/.dir_colors ~/.dir_colors
ln -vnsf $DOTFILESSYNC_DIR/zsh/.zshrc ~/.zshrc
ln -vnsf $DOTFILESSYNC_DIR/zsh/.p10k.zsh ~/.p10k.zsh

# EDITOR
ln -vnsf $DOTFILESSYNC_DIR/vim/.vimrc ~/.vimrc
ln -vnsf $DOTFILESSYNC_DIR/nvim ~/.config/nvim
ln -vnsf $DOTFILESSYNC_DIR/git/.gitconfig ~/.gitconfig
ln -vnsf $DOTFILESSYNC_DIR/gdb/gdbinit ~/.config/gdb/gdbinit

# TERMINAL / PROMPT
ln -vnsf $DOTFILESSYNC_DIR/alacritty ~/.config/alacritty
ln -vnsf $DOTFILESSYNC_DIR/tmux/.tmux.conf ~/.tmux.conf
ln -vnsf $DOTFILESSYNC_DIR/starship/starship.toml ~/.config/starship.toml

# APPLICATIONS
ln -vnsf $DOTFILESSYNC_DIR/pgcli/config ~/.config/pgcli/config
ln -vnsf $DOTFILESSYNC_DIR/neofetch/config.conf ~/.config/neofetch/config.conf
ln -vnsf $DOTFILESSYNC_DIR/conda/.condarc ~/.condarc
ln -vnsf $DOTFILESSYNC_DIR/ptpython/config.py ~/.config/ptpython/config.py

# X11 Server
ln -vnsf $DOTFILESSYNC_DIR/x11/.xinitrc ~/.xinitrc
ln -vnsf $DOTFILESSYNC_DIR/x11/.Xauthority ~/.Xauthority
ln -vnsf $DOTFILESSYNC_DIR/x11/.Xresources ~/.Xresources

# WINDOW MANAGER
ln -vnsf $DOTFILESSYNC_DIR/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -vnsf $DOTFILESSYNC_DIR/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -vnsf $DOTFILESSYNC_DIR/picom/picom.conf ~/.config/picom/picom.conf
ln -vs $DOTFILESSYNC_DIR/polybar ~/.config/polybar

ln -vs $DOTFILESSYNC_DIR/x11/.Xresources ~/.Xresources





git clone git@github.com:kiran94/wallpapers.git ~/.config/wallpapers
