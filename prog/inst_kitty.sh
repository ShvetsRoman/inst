#!/bin/bash
#set -e
 
# Визначити абсолютний шлях до директорії, де лежить цей скрипт
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR_CONF="${SCRIPT_DIR}"/conf

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

##### kitty #####
color green "[*] Installing kitty..."
sudo pacman -S --noconfirm --needed kitty ttf-nerd-fonts-symbols-mono

# Copy config kitty
if [[ -d "${HOME_DIR_CONF}"/kitty ]]; then
  color green "[*] Removing old config..."
  rm -rf "${HOME_DIR_CONF}"/kitty
fi

color green "[*] Copy new config..."${SCRIPT_DIR_CONF}"/kitty "${HOME_DIR_CONF}"/"
cp -rv "${SCRIPT_DIR_CONF}"/kitty "${HOME_DIR_CONF}"/ 

