#!/bin/bash
 
# Dirs
DIR_TEMP_CONF="$HOME/temp/inst/prog/conf"
DIR_FONT="$HOME/.local/share/fonts"
 # Install Fonts
install_fonts() {
  echo -e "\n[*] Installing fonts..."
    if [[ -d "$DIR_FONT" ]]; then
    cp -rf $DIR_TEMP_CONF/fonts/* "$DIR_FONT"
  else
    mkdir -p "$DIR_FONT"
    cp -rf $DIR_TEMP_CONF/fonts/* "$DIR_FONT"
  fi
}
 # Main
main() {
  clear
  install_fonts
}
main
