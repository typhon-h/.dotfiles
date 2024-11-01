#!/bin/bash

cd $HOME
rm -rf .dotfiles/
git clone git@github.com:typhon-h/.dotfiles.git


# Install required packages
xargs -a .dotfiles/apt-packages.list sudo apt-get -y --ignore-missing install
xargs -a .dotfiles/snap-packages.list sudo snap --classic install

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes


# Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh -s -- launch=n


# Nerd Font
curl -L -o ~/.local/share/fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/
rm ~/.local/share/fonts/JetBrainsMono.zip
fc-cache -fv

if [ -f "$HOME/.bashrc"]; then
  mv "$HOME/.bashrc" "$HOME/.bashrc.backup"
fi

if [ -f ~/.zshc]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

cd .dotfiles

# Setup config symlinks
ln -sf "$PWD/.stow-global-ignore" "$HOME/.stow-global-ignore"
stow -v -R --adopt -t $HOME */
git restore .
