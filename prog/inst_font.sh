#!/bin/bash
 
if [[ -f "${HOME}"/00_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/00_project/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
fi

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
    cp -rf "$DIR_TEMP_CONF"/fonts/* "$DIR_FONT"
  else
    mkdir -p "$DIR_FONT"
    cp -rf "$DIR_TEMP_CONF"/fonts/* "$DIR_FONT"
  fi
#  mv "$DIR_FONT"/.fonts.conf "$HOME"/
}
 # Main
main() {
  clear
  install_fonts
}
main
