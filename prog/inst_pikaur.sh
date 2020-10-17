#!/bin/bash

# Установка git, base-devel
sudo pacman -S --noconfirm --needed git base-devel

# Установка pikaur
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -si --skipinteg
cd ..
rm -rf pikaur

sed -i 's/^noedit = no/noedit = yes/g' ${HOME}/.config/pikaur.conf
sed -i 's/^nodiff = no/nodiff = yes/g' ${HOME}/.config/pikaur.conf
