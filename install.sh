#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


cd $HOME
rm -rf .dotfiles/
git clone git@github.com:typhon-h/.dotfiles.git
cd .dotfiles/

yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Only on linux
if ! echo "$OSTYPE" | grep -q "^darwin"; then
  sudo apt update && sudo apt upgrade
  sudo apt install snapd
  sudo apt-get install build-essential procps curl file git
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> bashrc/.bashrc
else
  xcode-select --install
fi

brew bundle -v --file Brewfile

# casks on osx vs misc install scripts on linux
if echo "$OSTYPE" | grep -q "^darwin"; then
  brew bundle -v --file Brewfile.osx-casks
else
  ./install_linux_apps.sh
fi


brew update && brew upgrade


# Setup config symlinks
ln -sf "$PWD/.stow-global-ignore" "$HOME/.stow-global-ignore"
stow -v -R --adopt -t $HOME */
git restore .
