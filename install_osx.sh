#!/bin/bash

cd $HOME/.dotfiles

yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --file Brewfile
