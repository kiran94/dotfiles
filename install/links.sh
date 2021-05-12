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
