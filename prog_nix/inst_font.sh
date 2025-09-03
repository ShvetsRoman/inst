#!/bin/bash
 
# Визначити абсолютний шлях до директорії, де лежить цей скрипт
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR_CONF="${SCRIPT_DIR}"/conf_nix

FONT_DIR="$HOME"/.local/share/fonts

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
  if [[ -d "$FONT_DIR" ]]; then
    cp -rf "$SCRIPT_DIR_CONF"/fonts/* "$FONT_DIR"
  else
    mkdir -p "$FONT_DIR"
    cp -rf "$SCRIPT_DIR_CONF"/fonts/* "$FONT_DIR"
  fi
mv "$FONT_DIR"/.fonts.conf "$HOME"/
}
 # Main
main() {
  clear
  install_fonts
}
main
