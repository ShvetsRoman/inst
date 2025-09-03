#!/bin/bash
#set -e

# Визначити абсолютний шлях до директорії, де лежить цей скрипт
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR_CONF="${SCRIPT_DIR}"/conf_nix

# HOME .config
HOME_DIR_CONF="${HOME}"/.config
  
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
if [[ -d "${HOME_DIR_CONF}"/nvim ]]; then
  color red "[*] Deleting a folder nvim..."
  rm -rf "${HOME_DIR_CONF}"/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
fi

# Установка конфига для NEOVIM NvChad !!!
color green "[*] Installing NvChad..."
# git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
git clone https://github.com/NvChad/starter ~/.config/nvim

# Копирование конфига
color green "[*] Copy settings custom..."
cp -rfv "${SCRIPT_DIR_CONF}"/nvim "${HOME_DIR_CONF}"/
nvim
