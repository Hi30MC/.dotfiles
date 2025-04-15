#!/bin/bash

#yes I know the way this is made is super non-standard, fight me

# install paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# install base packages
paru -S zsh firefox discord kde-connect alacritty starship

# install vencord
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# install openasar
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# switch to zsh
chsh -s $(which zsh)

# install zsh scripts
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git  ~/.local/share/zsh/scripts/F-Sy-H
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.local/share/zsh/scripts/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.local/share/zsh/scripts/zsh-completions

# install secondary packages

paru -S code cloudflare-warp-bin
