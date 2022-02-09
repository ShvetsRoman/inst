#!/bin/bash
#set -e

DIR_TEMP_CONF="${HOME}/temp/inst/prog/conf"
 
# Установка VIM
sudo pacman -S --noconfirm --needed vim

# Backup .vimrc
if [[ -e "${HOME}/.vimrc" ]]; then
    mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
fi

# Копирование config .vimrc
cp -rfv ${DIR_TEMP_CONF}/vim/.vimrc ${HOME}/
