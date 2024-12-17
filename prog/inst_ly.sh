#!/bin/bash

if [[ -f "${HOME}"/00_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/00_project/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
fi
 
color() {
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

color green "[*] Install Ly - display manager"
pikaur -S --noconfirm --needed ly
color green "[*] Enable the service"
sudo systemctl enable ly.service
color green "[*] Ly's start you also have to disable getty"
sudo systemctl disable getty@tty2.service
# if [[ -d "${DIR_HOME_CONF}/ly" ]]; then
#   rm -rf ${DIR_HOME_CONF}/ly
# fi
# cp -rv ${DIR_TEMP_CONF}/ly ${DIR_HOME_CONF}/ 

if [[ -d "/etc/lightdm" ]]; then
  color green "[*] Delete LightDM"
  sudo systemctl disable lightdm.service
  sudo pacman -Rns --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
  sudo rm -rf /etc/lightdm
fi

if [[ -d "/usr/lib/sddm" ]]; then
  color green "[*] Delete SDDM"
  sudo systemctl disable sddm.service
  sudo pacman -Rns --noconfirm sddm
  sudo rm -rf /usr/lib/sddm
  sudo rm -rf /etc/sddm.conf.d
  sudo rm -rf /usr/share/sddm
fi
