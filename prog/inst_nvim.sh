#!/bin/bash
#set -e

DIR_HOME_CONF="${HOME}/.config" 
DIR_TEMP_CONF="${HOME}/temp/inst/prog/conf"
 
# Del если есть nvim
if [[ -d "${DIR_HOME_CONF}/nvim" ]]; then
  echo -e "\n[*] Deleting a folder nvim..."
  rm -rf ${DIR_HOME_CONF}/nvim
fi

# Установка NEOVIM
echo -e "\n[*] Installing NeoVim..."
sudo pacman -S --noconfirm --needed neovim

# Установка конфига для NEOVIM NvChad !!!
echo -e "\n[*] Installing NvChad..."
git clone https://github.com/NvChad/NvChad ${DIR_HOME_CONF}/nvim && nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
# git clone https://github.com/NvChad/NvChad ~/.config/nvim

# Копирование конфига
echo -e "\n[*] Copy settings custom..."
mkdir -p ${DIR_HOME_CONF}/nvim/lua/custom
cp -rfv ${DIR_TEMP_CONF}/nvim ${DIR_HOME_CONF}/
