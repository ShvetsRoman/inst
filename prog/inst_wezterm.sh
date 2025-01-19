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

##### WezTerm #####
color green "[*] Installing WezTerm..."
sudo pacman -S --noconfirm --needed wezterm ttf-nerd-fonts-symbols-mono

# Copy config WezTerm
if [[ -d "${DIR_HOME_CONF}"/wezterm ]]; then
  color green "[*] Removing old config..."
  rm -rf "${DIR_HOME_CONF}"/wezterm
fi

color green "[*] Copy new config..."
cp -rv "${DIR_TEMP_CONF}"/wezterm "${DIR_HOME_CONF}"/ 
