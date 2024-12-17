#!/bin/bash
#set -e

if [[ -f "${HOME}"/00_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/00_project/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
fi
  
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
if [[ -d "${DIR_HOME_CONF}"/nvim ]]; then
  color red "[*] Deleting a folder nvim..."
  rm -rf "${DIR_HOME_CONF}"/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
fi

# Установка NEOVIM
color green "[*] Installing NeoVim..."
sudo pacman -S --noconfirm --needed neovim xclip

# Установка конфига для NEOVIM NvChad !!!
color green "[*] Installing NvChad..."
# git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

# Копирование конфига
color green "[*] Copy settings custom..."
cp -rfv "${DIR_TEMP_CONF}"/nvim "${DIR_HOME_CONF}"/
nvim
