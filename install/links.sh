#!/bin/bash

DOTFILESSYNC_CONFIG="${DOTFILESSYNC_CONFIG:-$HOME/.config/dotfiles/dotfiles-sync.json}"
DOTFILESSYNC_DIR="${DOTFILESSYNC_DIR:-$HOME/.config/dotfiles}"

echo $DOTFILESSYNC_DIR

ln -vns $DOTFILESSYNC_DIR/alacritty ~/.config/alacritty
ln -vns $DOTFILESSYNC_DIR/nvim ~/.config/nvim
ln -vns $DOTFILESSYNC_DIR/bash ~/.config/bash
ln -vns $DOTFILESSYNC_DIR/bash/.bashrc ~/.bashrc
ln -vns $DOTFILESSYNC_DIR/zsh/.zshrc ~/.zshrc
ln -vns $DOTFILESSYNC_DIR/zsh/.p10k.zsh ~/.p10k.zsh
ln -vns $DOTFILESSYNC_DIR/git/.gitconfig ~/.gitconfig
ln -vns $DOTFILESSYNC_DIR/tmux/.tmux.conf ~/.tmux.conf
ln -vns $DOTFILESSYNC_DIR/starship/starship.toml ~/.config/starship.toml
ln -vns $DOTFILESSYNC_DIR/pgcli/config ~/.config/pgcli/config
ln -vns ~/.config/dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf
ln -vns ~/.config/dotfiles/conda/.condarc ~/.condarc
ln -vns ~/.config/dotfiles/ptpython/config.py ~/.config/ptpython/config.py