#!/bin/bash
 
DIR_HOME_CONF="${HOME}/.config" 
DIR_TEMP_CONF="${HOME}/temp/inst/prog/conf"
 
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

# Установка pikaur
color green "[*] Installing pikaur..."
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri

##### Copy config Pikaur #####
color green "[*] Copy config Pikaur..."
cp -rfv ${DIR_TEMP_CONF}/pikaur/pikaur.conf ${DIR_HOME_CONF}/ 
 
# Если папка pikaur есть, тогда удаляем.
if [[ -e "${HOME}/pikaur" ]]; then
    rm -rf ${HOME}/pikaur
fi
