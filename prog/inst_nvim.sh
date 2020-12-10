#!/bin/bash

# Установка NEOVIM
sudo pacman -S --noconfirm --needed neovim

# Backup init.vim
if [[ -e ${HOME}/.config/nvim/init.vim ]]; then
    mv ${HOME}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim.bak
fi

# Копирование config init.vim
mkdir -p ${HOME}/.config/nvim/
cd ${HOME}/.config/nvim/
wget https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/init.vim
