#! /bin/bash

# Create a list of all the packages installed manually with apt
# This list can then be used to bulk install packages on a new system
# with $ xargs sudo apt -y install < pkglist

# Taken from https://askubuntu.com/a/492343
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) > pkglist
