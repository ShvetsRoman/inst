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

# Copy config WezTerm
if [[ -d "${HOME_DIR_CONF}"/wezterm ]]; then
  color green "[*] Removing old config..."
  rm -rf "${HOME_DIR_CONF}"/wezterm
fi

color green "[*] Copy new config..."${SCRIPT_DIR_CONF}"/wezterm "${HOME_DIR_CONF}"/"
cp -rv "${SCRIPT_DIR_CONF}"/wezterm "${HOME_DIR_CONF}"/ 
