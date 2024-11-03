#!/bin/bash

cd $HOME
rm -rf .dotfiles/
git clone git@github.com:typhon-h/.dotfiles.git
cd .dotfiles/

sudo apt update && sudo apt upgrade
sudo apt install snapd

yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Only on linux
if [ "$OSTYPE" != "darwin"* ]; then
  sudo apt-get install build-essential procps curl file git
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> bashrc/.bashrc
fi

brew bundle -v --file Brewfile

if [ "$OSTYPE" == "darwin"* ]; then
  brew bundle -v --file Brewfile.osx-casks
else
  ./install_linux_apps.sh
fi


brew update && brew upgrade


# Setup config symlinks
ln -sf "$PWD/.stow-global-ignore" "$HOME/.stow-global-ignore"
stow -v -R --adopt -t $HOME */
git restore .
