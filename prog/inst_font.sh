#!/bin/bash
 
# Визначити абсолютний шлях до директорії, де лежить цей скрипт
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR_CONF="${SCRIPT_DIR}"/conf

DIR_FONT="$HOME"/.local/share/fonts

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

# Install Fonts
install_fonts() {
  color green "\n[*] Installing fonts..."
  if [[ -d "$DIR_FONT" ]]; then
    cp -rf "$SCRIPT_DIR_CONF"/fonts/* "$DIR_FONT"
  else
    mkdir -p "$DIR_FONT"
    cp -rf "$SCRIPT_DIR_CONF"/fonts/* "$DIR_FONT"
  fi
}

# Main
main() {
  clear
  install_fonts
}
main
