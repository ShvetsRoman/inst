#!/bin/bash

# Установка NEOVIM
sudo pacman -S --noconfirm --needed neovim

# Backup init.vim
if [[ -e ${HOME}/.config/nvim/init.vim ]]; then
    mv ${HOME}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim.bak
fi

# Копирование config init.vim
curl -fLo ${HOME}/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/conf/init.vim
