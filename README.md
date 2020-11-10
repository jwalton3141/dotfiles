This repo aims to provision a light, performant and keyboard driven Ubuntu configuration that *just work*s.

![example desktop](https://raw.githubusercontent.com/jwalton3141/dotfiles/main/example-1.png)

## What's provisioned?

* [Alacritty](https://github.com/alacritty/alacritty) provides the terminal emulator. Marketed as "the fastest terminal emulator in existence".
* [i3wm](https://i3wm.org/) is configured as the window manager. Keybindings are set to match that of the vim set-up.
* [Polybar](https://github.com/polybar/polybar) provides the top bar for the desktop. Polybar can be fiddly to correctly install and configure. Here the ins:tall and configuration is done for you.
* [Vim]() is my text editor of choice, the plugins [vim-airline]() and [vim-snazzy]() are installed to work out of the box.
* [Zsh](https://wiki.archlinux.org/index.php/zsh) is used as the default shell. Zsh goodies are of course provisioned through the [oh-my-zsh project](https://github.com/ohmyzsh/ohmyzsh).
* *Fonts that work*. Getting fonts and icons set-up to work with vim and polybar is a pain. Here fonts with good support for vim and polybar are installed and configured to play nice.

## Installing

With a fresh Ubuntu (or similar) install you'll first need to install git:

```sh
sudo apt install git
```

You can then go ahead and clone this repo with

```sh
git clone https://github.com/jwalton3141/dotfiles.git
```

Change into the directory created by your clone command (here `dotfiles/`), and run `./setup.sh`

```sh
cd dotfiles && ./setup.sh
```

And you're done. Exit your current session, select i3 and log back in.

## Tweaking defaults

There are a number of things which you may with to tweak before running `setup.sh`. 

* Firstly, you likely wish to alter the `git config` as defined in lines 15--17 of `setup.sh` to reflect your user.

* You almost certainly will wish to amend the list of packages to install. The packages to install are in `scripts/pkglist`. Be careful when you remove items from this list as the program you remove may be needed for `setup.sh` to successfully complete.
* `scripts/piplist` can be ammended if you're a python user and have other package requirements. If you're not a python user you can safely remove line 12 (`scripts/install_pip.sh`) of `setup.sh`

---

*Tested on Ubuntu 18.04 LTS and 20.04 LTS*

 

