#!/bin/bash
#set -e
 
# Визначити абсолютний шлях до директорії, де лежить цей скрипт
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR_CONF="${SCRIPT_DIR}"/conf
 
DIR_HOME_CONF="${HOME}"/.config

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

##### Yazi #####
color green "[*] Installing Yazi..."
sudo pacman -S --noconfirm --needed yazi ffmpeg p7zip jq poppler fd ripgrep fzf zoxide imagemagick

# Copy config Yazi (terminal-file-manager) 
if [[ -d "${DIR_HOME_CONF}"/yazi ]]; then
  color green "[*] Removing old config..."
  rm -rf "${DIR_HOME_CONF}"/yazi
fi

color green "[*] Copy new config..."
cp -rv "${SCRIPT_DIR_CONF}"/yazi "${DIR_HOME_CONF}"/ 
