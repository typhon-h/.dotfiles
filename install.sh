#!/bin/bash

cd $HOME
rm -rf .dotfiles/
git clone git@github.com:typhon-h/.dotfiles.git
cd .dotfiles/

# Check for OSX
if [[ "$OSTYPE" == "darwin"* ]]; then
    ./install_osx.sh
else
    ./install_linux.sh
fi


if [ -f "$HOME/.bashrc" ]; then
  mv "$HOME/.bashrc" "$HOME/.bashrc.backup"
fi

if [ -f "$HOME/.zshc" ]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi


# Setup config symlinks
ln -sf "$PWD/.stow-global-ignore" "$HOME/.stow-global-ignore"
stow -v -R --adopt -t $HOME */
git restore .
