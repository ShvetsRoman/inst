#!/bin/bash
#set -e

DIR_HOME_CONF="${HOME}/.config" 
DIR_TEMP_CONF="${HOME}/temp/inst/prog/conf"
  
function color() {
  case "$1" in
    red)
      echo -e "\n\033[31m$2\033[0m"
    ;;
    yellow)
      echo -e "\n\033[33m$2\033[0m"
    ;;
    green)
      echo -e "\n\033[32m$2\033[0m"
    ;;
  esac
}

# Del если есть nvim
if [[ -d "${DIR_HOME_CONF}/nvim" ]]; then
  color green "[*] Deleting a folder nvim..."
  rm -rf ${DIR_HOME_CONF}/nvim
fi

# Установка NEOVIM
color green "[*] Installing NeoVim..."
sudo pacman -S --noconfirm --needed neovim

# Установка конфига для NEOVIM NvChad !!!
color green "[*] Installing NvChad..."
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
# git clone https://github.com/NvChad/NvChad ~/.config/nvim

# Копирование конфига
color green "[*] Copy settings custom..."
mkdir -p ${DIR_HOME_CONF}/nvim/lua/custom
cp -rfv ${DIR_TEMP_CONF}/nvim ${DIR_HOME_CONF}/
