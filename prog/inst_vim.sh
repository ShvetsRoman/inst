#!/bin/bash

# Установка VIM
sudo pacman -S --noconfirm --needed vim

# Backup .vimrc
if [[ -e ${HOME}/.vimrc ]]; then
    mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
fi

# Копирование config .vimrc
cd ${HOME}/
wget https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/vimrc
mv ${HOME}/vimrc ${HOME}/.vimrc
