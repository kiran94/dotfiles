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
ln -vnsf $DOTFILESSYNC_DIR/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml


ln -vnsf $DOTFILESSYNC_DIR/tmux/.tmux.conf ~/.tmux.conf
ln -vnsf $DOTFILESSYNC_DIR/starship/starship.toml ~/.config/starship.toml

# APPLICATIONS
ln -vnsf $DOTFILESSYNC_DIR/pgcli/config ~/.config/pgcli/config
ln -vnsf $DOTFILESSYNC_DIR/neofetch/config.conf ~/.config/neofetch/config.conf
ln -vnsf $DOTFILESSYNC_DIR/conda/.condarc ~/.condarc
ln -vnsf $DOTFILESSYNC_DIR/ptpython/config.py ~/.config/ptpython/config.py

case "$(uname -s)" in
    Darwin)
        VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
        ;;
    Linux)
        VSCODE_USER_DIR="$HOME/.config/Code/User"
        ;;
esac

if [ -n "$VSCODE_USER_DIR" ]; then
    mkdir -p "$VSCODE_USER_DIR"
    ln -vnsf "$DOTFILESSYNC_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
fi

# CODEX
mkdir -p ~/.codex
ln -vnsf "$DOTFILESSYNC_DIR"/codex/AGENTS.md ~/.codex/AGENTS.md
ln -vnsf "$DOTFILESSYNC_DIR"/codex/skills ~/.codex/skills
