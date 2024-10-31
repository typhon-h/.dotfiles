#!/bin/bash

# Install required packages
sudo apt-get -y --ignore-missing install $(< packages.list)


# Starship
curl -sS https://starship.rs/install.sh | sh


# Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin


# Nerd Font
curl -L -o ~/.local/share/fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/
rm ~/.local/share/fonts/JetBrainsMono.zip
fc-cache -fv


# Setup config symlinks
ln -sf .stow-global-ignore $HOME/.stow-global-ignore
stow -v -R --adopt -t $HOME */
git restore .


# Source the relevant rc file if possible
rc_file="$HOME/.${SHELL##*/}rc"
if [ -f "$rc_file" ]; then
    source "$rc_file"
fi
