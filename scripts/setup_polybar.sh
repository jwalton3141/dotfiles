#! /bin/bash

# Overwrite polybar-3 theme defaults
cp dotfiles/polybar/{config-top.ini,launch.sh,modules.ini} ~/.config/polybar

# Copy pulseaudio control script over
cp dotfiles/polybar/pulseaudio-control.sh ~/.config/polybar/scripts
