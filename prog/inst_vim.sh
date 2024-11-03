#!/bin/bash
#set -e

if [[ -f "${HOME}"/01_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/01_project/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
fi
 
# Установка VIM
sudo pacman -S --noconfirm --needed vim

# Backup .vimrc
if [[ -e "${HOME}"/.vimrc ]]; then
    mv "${HOME}"/.vimrc "${HOME}"/.vimrc.bak
fi

# Копирование config .vimrc
cp -rfv "${DIR_TEMP_CONF}"/vim/.vimrc "${HOME}"/
