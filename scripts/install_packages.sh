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
    rm slack.deb
fi


# Install zoom
if ! type zoom > /dev/null
then
    wget -O zoom.deb \
        https://d11yldzmag5yn.cloudfront.net/prod/5.4.53391.1108/zoom_amd64.deb
    sudo dpkg -i zoom.deb
    # https://unix.stackexchange.com/a/159114
    sudo apt-get install -f
    rm zoom.deb
fi

# Install rstudio
if ! type rstudio > /dev/null
then
    wget -O rstudio.deb \
        https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.3.1093-amd64.deb
    sudo dpkg -i rstudio.deb
    # https://unix.stackexchange.com/a/159114
    sudo apt-get install -f
    rm rstudio.deb
fi
