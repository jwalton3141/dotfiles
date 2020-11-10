#! /bin/bash

# Use apt to install all of the pacages in pkglist
# pkglist can be constructed list_packages.sh 

# Get directory of this script so we can run this script from anywhere
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

xargs sudo apt -y install < $DIR/pkglist

# Install typora
# https://typora.io/#linux
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository -y 'deb https://typora.io/linux ./'
sudo apt-get -y update
sudo apt-get -y install typora

# Install slack
if ! type slack > /dev/null
then
    wget -O slack.deb \
        https://downloads.slack-edge.com/linux_releases/slack-desktop-4.11.0-amd64.deb
    sudo dpkg -i slack.deb
    # https://unix.stackexchange.com/a/159114
    sudo apt-get install -f
fi
