#!/bin/bash

DOTFILESSYNC_CONFIG="${DOTFILESSYNC_CONFIG:-$HOME/.config/dotfiles/dotfiles-sync.json}"
DOTFILESSYNC_DIR="${DOTFILESSYNC_DIR:-$HOME/.config/dotfiles}"

# echo $DOTFILESSYNC_DIR

ln -vnsf $DOTFILESSYNC_DIR/alacritty ~/.config/alacritty
ln -vnsf $DOTFILESSYNC_DIR/nvim ~/.config/nvim
ln -vnsf $DOTFILESSYNC_DIR/bash ~/.config/bash
ln -vnsf $DOTFILESSYNC_DIR/bash/.bashrc ~/.bashrc
ln -vnsf $DOTFILESSYNC_DIR/bash/.dir_colors ~/.dir_colors
ln -vnsf $DOTFILESSYNC_DIR/zsh/.zshrc ~/.zshrc
ln -vnsf $DOTFILESSYNC_DIR/zsh/.p10k.zsh ~/.p10k.zsh
ln -vnsf $DOTFILESSYNC_DIR/git/.gitconfig ~/.gitconfig
ln -vnsf $DOTFILESSYNC_DIR/tmux/.tmux.conf ~/.tmux.conf
ln -vnsf $DOTFILESSYNC_DIR/starship/starship.toml ~/.config/starship.toml
ln -vnsf $DOTFILESSYNC_DIR/pgcli/config ~/.config/pgcli/config
ln -vnsf $DOTFILESSYNC_DIR/neofetch/config.conf ~/.config/neofetch/config.conf
ln -vnsf $DOTFILESSYNC_DIR/conda/.condarc ~/.condarc
ln -vnsf $DOTFILESSYNC_DIR/ptpython/config.py ~/.config/ptpython/config.py
ln -vnsf $DOTFILESSYNC_DIR/vim/.vimrc ~/.vimrc
ln -vnsf $DOTFILESSYNC_DIR/gdb/gdbinit ~/.config/gdb/gdbinit
ln -vnsf $DOTFILESSYNC_DIR/ptpython/config.py ~/.config/ptpython/config.py
ln -vnsf $DOTFILESSYNC_DIR/vim/.vimrc ~/.vimrc
