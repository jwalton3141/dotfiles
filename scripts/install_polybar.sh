#! /bin/bash

# Polybar deps
sudo apt install -y \
    cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
    libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev \
    libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen \
    xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev \
    libiw-dev libcurl4-openssl-dev libpulse-dev \
    libxcb-composite0-dev xcb libxcb-ewmh2

if ! type polybar > /dev/null
then
    # Clone polybar
    git clone https://github.com/jaagr/polybar.git
    cd polybar
    git checkout 3.4.1
    ./build.sh
    cd ../
    rm -rf polybar
fi

# SVN for download of a single folder from git
sudo apt install -y subversion 

# Get the polybar theme I want
svn checkout https://github.com//adi1090x/polybar-themes/trunk/polybar-3 ~/.config/polybar
