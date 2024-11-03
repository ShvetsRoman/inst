#!/bin/bash
#set -e
 
if [[ -f "${HOME}"/01_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/01_project/sh/inst/prog/source_dir.sh
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

##### BSPWM #####
color green "[*] Installing bspwm + sxhkd..."
sudo pacman -S --noconfirm --needed bspwm sxhkd
# Copy config bspwm
if [[ -d "${DIR_HOME_CONF}"/bspwm ]]; then
  rm -rf "${DIR_HOME_CONF}"/bspwm
fi
cp -rv "${DIR_TEMP_CONF}"/bspwm "${DIR_HOME_CONF}"/ 
chmod -R +x "${DIR_HOME_CONF}"/bspwm
# Copy config sxhkd
if [[ -d "${DIR_HOME_CONF}"/sxhkd ]]; then
  rm -rf "${DIR_HOME_CONF}"/sxhkd
fi
cp -rv "${DIR_TEMP_CONF}"/sxhkd "${DIR_HOME_CONF}"/ 
chmod -R +x "${DIR_HOME_CONF}"/sxhkd
 
##### Rofi #####
color green "[*] Installing rofi..."
sudo pacman -S --noconfirm --needed rofi
# Copy config Rofi 
if [[ -d "${DIR_HOME_CONF}"/rofi ]]; then
  rm -rf "${DIR_HOME_CONF}"/rofi
fi
cp -rv "${DIR_TEMP_CONF}"/rofi "${DIR_HOME_CONF}"/ 
chmod -R +x "${DIR_HOME_CONF}"/rofi/bin

##### Dunst #####
color green "[*] Installing dunst..."
sudo pacman -S --noconfirm --needed dunst
# Copy config Dunst 
if [[ -d "${DIR_HOME_CONF}"/dunst ]]; then
  rm -rf "${DIR_HOME_CONF}"/dunst
fi
cp -rv "${DIR_TEMP_CONF}"/dunst "${DIR_HOME_CONF}"/ 

##### Polybar #####
color green "[*] Installing polybar..."
pikaur -S --noconfirm --needed polybar wmctrl udiskie
# Copy config Polybar
if [[ -d "${DIR_HOME_CONF}"/polybar ]]; then
  rm -rf "${DIR_HOME_CONF}"/polybar
fi
cp -rv "${DIR_TEMP_CONF}"/polybar "${DIR_HOME_CONF}"/ 
chmod +x "${DIR_HOME_CONF}"/polybar/launch.sh
chmod -R +x "${DIR_HOME_CONF}"/polybar/scripts

##### Picom #####
color green "[*] Installing picom-git..."
# pikaur -S --noconfirm --needed picom-git
pikaur -S --noconfirm --needed picom-ibhagwan-git
# Copy config Picom 
if [[ -d "${DIR_HOME_CONF}"/picom ]]; then
  rm -rf "${DIR_HOME_CONF}"/picom
fi
cp -rv "${DIR_TEMP_CONF}"/picom "${DIR_HOME_CONF}"/ 
 
##### lf #####
color green "[*] Installing lf..."
pikaur -S --noconfirm --needed lf
# Copy config LF (terminal-file-manager) 
if [[ -d "${DIR_HOME_CONF}"/lf ]]; then
  rm -rf "${DIR_HOME_CONF}"/lf
fi
cp -rv "${DIR_TEMP_CONF}"/lf "${DIR_HOME_CONF}"/ 
if [[ -d "${DIR_HOME_CONF}"/lf-ueberzug ]]; then
  rm -rf "${DIR_HOME_CONF}"/lf-ueberzug
fi
cp -rv "${DIR_TEMP_CONF}"/lf-ueberzug "${DIR_HOME_CONF}"/ 

##### alacritty #####
color green "[*] Installing alacritty..."
sudo pacman -S --noconfirm --needed alacritty
# Copy config Alacritty(terminal) 
if [[ -d "${DIR_HOME_CONF}"/alacritty ]]; then
  rm -rf "${DIR_HOME_CONF}"/alacritty
fi
cp -rv "${DIR_TEMP_CONF}"/alacritty "${DIR_HOME_CONF}"/
 
##### Kvantum #####
color green "[*] Installing kvantum..."
sudo pacman -S --noconfirm --needed kvantum
# Copy config Kvantum 
if [[ -d "${DIR_HOME_CONF}"/Kvantum ]]; then
  rm -rf "${DIR_HOME_CONF}"/Kvantum
fi
cp -rv "${DIR_TEMP_CONF}"/Kvantum "${DIR_HOME_CONF}"/
 
##### qt5ct #####
color green "[*] Installing qt5ct..."
sudo pacman -S --noconfirm --needed qt5ct
# Copy config environment & qt5ct
if [[ -d "${DIR_HOME_CONF}"/qt5ct ]]; then
  rm -rf "${DIR_HOME_CONF}"/qt5ct
fi
cp -rv "${DIR_TEMP_CONF}"/qt5ct "${DIR_HOME_CONF}"/ 
sudo mv -fv "${DIR_HOME_CONF}"/qt5ct/environment /etc/ 
 
##### gtk-2.0 #####
color green "[*] COPY CONFIGs gtk-2.0..."
# Copy config gtk-2.0 
if [[ -d "${DIR_HOME_CONF}"/gtk-2.0 ]]; then
  rm -rf "${DIR_HOME_CONF}"/gtk-2.0
fi
cp -rv "${DIR_TEMP_CONF}"/gtk-2.0 "${DIR_HOME_CONF}"/
 
##### gtk-3.0 #####
color green "[*] COPY CONFIGs gtk-3.0..."
# Copy config gtk-3.0 
if [[ -d "${DIR_HOME_CONF}"/gtk-3.0 ]]; then
  rm -rf "${DIR_HOME_CONF}"/gtk-3.0
fi
cp -rv "${DIR_TEMP_CONF}"/gtk-3.0 "${DIR_HOME_CONF}"/
 
##### gtk-4.0 #####
color green "[*] COPY CONFIGs gtk-4.0..."
# Copy config gtk-4.0 
if [[ -d "${DIR_HOME_CONF}"/gtk-4.0 ]]; then
  rm -rf "${DIR_HOME_CONF}"/gtk-4.0
fi
cp -rv "${DIR_TEMP_CONF}"/gtk-4.0 "${DIR_HOME_CONF}"/

##### COPY CONFIGs SYSTEMs #####
color green "[*] COPY CONFIGs SYSTEMs..."
# Copy config .gtkrc-2.0 
cp -rfv "${DIR_TEMP_CONF}"/gtkrc/.gtkrc-2.0 "${HOME}"/ 
# Copy config .profile 
cp -rfv "${DIR_TEMP_CONF}"/profile/.profile "${HOME}"/ 
# Copy config .Xresources 
cp -rfv "${DIR_TEMP_CONF}"/xresources/.Xresources "${HOME}"/
# Copy config .xinitrc
cp -rfv "${DIR_TEMP_CONF}"/xinitrc/.xinitrc "${HOME}"/
chmod -R +x "${HOME}"/.xinitrc
# Copy config .fehbg
cp -rfv "${DIR_TEMP_CONF}"/fehbg/.fehbg "${HOME}"/

##### PROGRAMs #####
# Numlock ON
color green "[*] Installing Numlock ON..."
sudo pacman -S --noconfirm --needed numlockx 
# Font 
color green "[*] Installing ttf-font-icons..."
pikaur -S --noconfirm --needed ttf-font-icons 
# google-chrome 
color green "[*] Installing google-chrome..."
pikaur -S --noconfirm --needed google-chrome
# deadbeef 
#color green "[*] Installing deadbeef..."
#pikaur -S --noconfirm --needed deadbeef
# Spotify 
#color green "[*] Installing Spotify..."
#flatpak install -y spotify
