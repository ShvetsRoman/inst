#!/bin/bash
 
DIR_HOME_CONF="${HOME}/.config" 
DIR_TEMP_CONF="${HOME}/temp/inst/prog/conf"
 
# Установка pikaur
echo -e "\n[*] Installing pikaur..."
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri

##### Copy config Pikaur #####
echo -e "\n[*] Copy config Pikaur..."
cp -rfv ${DIR_TEMP_CONF}/pikaur/pikaur.conf ${DIR_HOME_CONF}/ 
 
# Если папка pikaur есть, тогда удаляем.
if [[ -e "${HOME}/pikaur" ]]; then
    rm -rf ${HOME}/pikaur
fi
