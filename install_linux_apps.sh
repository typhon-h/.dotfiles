#!/bin/bash

while IFS= read -r app; do
  sudo snap install "$app" --classic
done < cross-platform.apps

# Kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh -s -- launch=n
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop


# Nerd Font
curl -L -o ~/.local/share/fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/
rm ~/.local/share/fonts/JetBrainsMono.zip
fc-cache -fv
