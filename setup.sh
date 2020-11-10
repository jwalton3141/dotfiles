#! /bin/bash

# Update and upgrade before doing anything else
sudo apt -y update
sudo apt -y upgrade

# Add repo for alacritty terminal emulator
sudo add-apt-repository -y ppa:mmstick76/alacritty
# Install packages as detailed in scripts/pkglist
scripts/install_packages.sh
# Install python packages as detailed in scripts/piplist
scripts/install_pip.sh



# Set up bare minimum git config
git config --global user.email "jwalton3141@gmail.com"
git config --global user.name "Jack Walton"
git config --global core.editor "vim"



# Change default shell to zsh
chsh -s $(which zsh)

# Install ohmyzsh
rm -rf $HOME/.oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh

# Install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Get the pure prompt for zsh
rm -rf $HOME/.zsh
mkdir $HOME/.zsh
git clone https://github.com/sindresorhus/pure.git $HOME/.zsh/pure



# Get vim-plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim tab completion
rm -rf $HOME/.vim/pack/vendor/start/VimCompletesMe
git clone git://github.com/ajh17/VimCompletesMe.git \
    $HOME/.vim/pack/vendor/start/VimCompletesMe



# Setup dotfiles (do after vim plugs)
scripts/dot_setup.sh
# Apply .gitignore globally
git config --global core.excludesfile $HOME/.gitignore



# Install vim plugins (after dot_setup.sh)
vim +PlugInstall +qall > /dev/null



# Fonts (FiraCode Nerd Font)
curl -Lo $HOME/".fonts/Fira Code Regular Nerd Font Complete.ttf" --create-dirs \
    https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf

curl -Lo $HOME/".fonts/Fira Code Bold Nerd Font Complete.ttf" --create-dirs \
    https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete.ttf

# Build font cache
fc-cache $HOME/.fonts



# Clone polybar and theme 
scripts/install_polybar.sh
# Setup module files and appearance for this system
scripts/setup_polybar.sh



# Make sure the time and date are setup correctly
timedatectl set-timezone "Europe/London"



# Tidy up after installs
sudo apt -y autoremove
