#!/bin/bash

# Установка pikaur
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -si --skipinteg
cd ..
rm -rf pikaur

# Настройка PIKAUR
sudo sed -i 's/^noedit = no/noedit = yes/g' ${HOME}/.config/pikaur.conf
sudo sed -i 's/^nodiff = no/nodiff = yes/g' ${HOME}/.config/pikaur.conf
