#!/bin/bash
 
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

# Установка paru
color green "[*] Installing paru..."
clone https://aur.archlinux.org/paru.git
cd paru || exit
makepkg -si

# Если папка paru есть, тогда удаляем.
if [[ -e "${HOME}"/paru ]]; then
    rm -rf "${HOME}"/paru
fi
