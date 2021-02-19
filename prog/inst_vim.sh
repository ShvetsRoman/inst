#!/bin/bash

# Установка VIM
sudo pacman -S --noconfirm --needed vim

# Backup .vimrc
if [[ -e ${HOME}/.vimrc ]]; then
    mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
fi

# Копирование config .vimrc
curl -fLo ${HOME}/.vimrc --create-dirs https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/vimrc
curl -fLo ${HOME}/.vim/colorrc.vim --create-dirs https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/colorrc.vim
