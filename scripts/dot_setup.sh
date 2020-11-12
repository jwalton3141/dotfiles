#!/bin/bash

# Get directory of this script, wherever executed from
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get directory of dotfiles
cd $SCRIPT_DIR
cd ../dotfiles
DOT_DIR="$(pwd)"

# Create dotfiles directory in home area if it does not exist
mkdir -p $HOME/.dotfiles

# Copy dotfiles from git-controlled directory to $HOME/.dotfiles
find $DOT_DIR -type f -exec cp {} $HOME/.dotfiles/ \;

# Array of dotfiles which need symlinking to the home area
DOTS=(
    alacritty.yml
    alias
    env
    functions
    gitignore
    latexmkrc
    vimrc
    xinitrc
    xprofile
    Xresources
    zshrc
)
# Symlink from .dotfiles to ~/
for file in "${DOTS[@]}"
do
	ln -sf $HOME/.dotfiles/"$file" $HOME/."$file"
done

# Don't display ssh welcome banner
touch $HOME/.hushlogin

# Copy ssh config file to $HOME/.ssh
mkdir -p $HOME/.ssh
cp $HOME/.dotfiles/ssh_config $HOME/.ssh/config

# i3 set-up
mkdir -p $HOME/.config/i3
ln -sf $HOME/.dotfiles/i3_config $HOME/.config/i3/config

