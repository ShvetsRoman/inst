#!/bin/bash
#set -e
 
DIR_HOME_CONF="${HOME}/.config" 
DIR_TEMP_CONF="${HOME}/temp/inst/prog/conf"
 
##### BSPWM #####
echo -e "\n[*] Installing bspwm + sxhkd..."
sudo pacman -S --noconfirm --needed bspwm sxhkd
# Copy config bspwm
if [[ -d "${DIR_HOME_CONF}/bspwm" ]]; then
  rm -rf ${DIR_HOME_CONF}/bspwm
fi
cp -rv ${DIR_TEMP_CONF}/bspwm ${DIR_HOME_CONF}/ 
chmod -R +x ${DIR_HOME_CONF}/bspwm
# Copy config sxhkd
if [[ -d "${DIR_HOME_CONF}/sxhkd" ]]; then
  rm -rf ${DIR_HOME_CONF}/sxhkd
fi
cp -rv ${DIR_TEMP_CONF}/sxhkd ${DIR_HOME_CONF}/ 
chmod -R +x ${DIR_HOME_CONF}/sxhkd
 
##### Rofi #####
echo -e "\n[*] Installing rofi..."
sudo pacman -S --noconfirm --needed rofi
# Copy config Rofi 
if [[ -d "${DIR_HOME_CONF}/rofi" ]]; then
  rm -rf ${DIR_HOME_CONF}/rofi
fi
cp -rv ${DIR_TEMP_CONF}/rofi ${DIR_HOME_CONF}/ 
chmod -R +x ${DIR_HOME_CONF}/rofi/bin

##### Dunst #####
echo -e "\n[*] Installing dunst..."
sudo pacman -S --noconfirm --needed dunst
# Copy config Dunst 
if [[ -d "${DIR_HOME_CONF}/dunst" ]]; then
  rm -rf ${DIR_HOME_CONF}/dunst
fi
cp -rv ${DIR_TEMP_CONF}/dunst ${DIR_HOME_CONF}/ 

##### Polybar #####
echo -e "\n[*] Installing polybar..."
pikaur -S --noconfirm --needed polybar
# Copy config Polybar
if [[ -d "${DIR_HOME_CONF}/polybar" ]]; then
  rm -rf ${DIR_HOME_CONF}/polybar
fi
cp -rv ${DIR_TEMP_CONF}/polybar ${DIR_HOME_CONF}/ 
chmod +x ${DIR_HOME_CONF}/polybar/launch.sh
chmod -R +x ${DIR_HOME_CONF}/polybar/scripts

##### Picom #####
echo -e "\n[*] Installing picom-git..."
pikaur -S --noconfirm --needed picom-git
# Copy config Picom 
if [[ -d "${DIR_HOME_CONF}/picom" ]]; then
  rm -rf ${DIR_HOME_CONF}/picom
fi
cp -rv ${DIR_TEMP_CONF}/picom ${DIR_HOME_CONF}/ 
 
##### lf #####
echo -e "\n[*] Installing lf..."
pikaur -S --noconfirm --needed lf
# Copy config LF (terminal-file-manager) 
if [[ -d "${DIR_HOME_CONF}/lf" ]]; then
  rm -rf ${DIR_HOME_CONF}/lf
fi
cp -rv ${DIR_TEMP_CONF}/lf ${DIR_HOME_CONF}/ 
if [[ -d "${DIR_HOME_CONF}/lf-ueberzug" ]]; then
  rm -rf ${DIR_HOME_CONF}/lf-ueberzug
fi
cp -rv ${DIR_TEMP_CONF}/lf-ueberzug ${DIR_HOME_CONF}/ 

##### alacritty #####
echo -e "\n[*] Installing alacritty..."
sudo pacman -S --noconfirm --needed alacritty
# Copy config Alacritty(terminal) 
if [[ -d "${DIR_HOME_CONF}/alacritty" ]]; then
  rm -rf ${DIR_HOME_CONF}/alacritty
fi
cp -rv ${DIR_TEMP_CONF}/alacritty ${DIR_HOME_CONF}/
 
##### Kvantum #####
echo -e "\n[*] Installing kvantum..."
sudo pacman -S --noconfirm --needed kvantum
# Copy config Kvantum 
if [[ -d "${DIR_HOME_CONF}/Kvantum" ]]; then
  rm -rf ${DIR_HOME_CONF}/Kvantum
fi
cp -rv ${DIR_TEMP_CONF}/Kvantum ${DIR_HOME_CONF}/
 
##### qt5ct #####
echo -e "\n[*] Installing qt5ct..."
sudo pacman -S --noconfirm --needed qt5ct
# Copy config environment & qt5ct
if [[ -d "${DIR_HOME_CONF}/qt5ct" ]]; then
  rm -rf ${DIR_HOME_CONF}/qt5ct
fi
cp -rv ${DIR_TEMP_CONF}/qt5ct ${DIR_HOME_CONF}/ 
sudo mv -fv ${DIR_HOME_CONF}/qt5ct/environment /etc/ 
 
##### gtk-2.0 #####
echo -e "\n[*] COPY CONFIGs gtk-2.0..."
# Copy config gtk-2.0 
if [[ -d "${DIR_HOME_CONF}/gtk-2.0" ]]; then
  rm -rf ${DIR_HOME_CONF}/gtk-2.0
fi
cp -rv ${DIR_TEMP_CONF}/gtk-2.0 ${DIR_HOME_CONF}/
 
##### gtk-3.0 #####
echo -e "\n[*] COPY CONFIGs gtk-3.0..."
# Copy config gtk-3.0 
if [[ -d "${DIR_HOME_CONF}/gtk-3.0" ]]; then
  rm -rf ${DIR_HOME_CONF}/gtk-3.0
fi
cp -rv ${DIR_TEMP_CONF}/gtk-3.0 ${DIR_HOME_CONF}/
 
##### gtk-4.0 #####
echo -e "\n[*] COPY CONFIGs gtk-4.0..."
# Copy config gtk-4.0 
if [[ -d "${DIR_HOME_CONF}/gtk-4.0" ]]; then
  rm -rf ${DIR_HOME_CONF}/gtk-4.0
fi
cp -rv ${DIR_TEMP_CONF}/gtk-4.0 ${DIR_HOME_CONF}/

##### COPY CONFIGs SYSTEMs #####
echo -e "\n[*] COPY CONFIGs SYSTEMs..."
# Copy config .gtkrc-2.0 
cp -rfv ${DIR_TEMP_CONF}/gtkrc/.gtkrc-2.0 ${HOME}/ 
# Copy config .profile 
cp -rfv ${DIR_TEMP_CONF}/profile/.profile ${HOME}/ 
# Copy config .Xresources 
cp -rfv ${DIR_TEMP_CONF}/xresources/.Xresources ${HOME}/
# Copy config .xinitrc
# cp -rfv ${DIR_TEMP_CONF}/xinitrc/.xinitrc ${HOME}/
# chmod -R +x ${HOME}/.xinitrc
# Copy config .fehbg
cp -rfv ${DIR_TEMP_CONF}/fehbg/.fehbg ${HOME}/

##### PROGRAMs #####
# Font 
echo -e "\n[*] Installing ttf-font-icons..."
pikaur -S --noconfirm --needed ttf-font-icons 
# google-chrome 
echo -e "\n[*] Installing google-chrome..."
pikaur -S --noconfirm --needed google-chrome
# deadbeef 
#echo -e "\n[*] Installing deadbeef..."
#pikaur -S --noconfirm --needed deadbeef
# Spotify 
#echo -e "\n[*] Installing Spotify..."
#flatpak install -y spotify
 
##### INSTALL THEMEs #####
# Themes GitHub McMojave
echo -e "\n[*] Installing McMojave..."
mkdir -p ${HOME}/.themes/github_themes/
cd ${HOME}/.themes/github_themes/
git clone https://github.com/vinceliuice/McMojave-kde
${HOME}/.themes/github_themes/McMojave-kde/install.sh
git clone https://github.com/vinceliuice/Mojave-gtk-theme
${HOME}/.themes/github_themes/Mojave-gtk-theme/install.sh
git clone https://github.com/vinceliuice/McMojave-circle
${HOME}/.themes/github_themes/McMojave-circle/install.sh -blue
rm -rf ${HOME}/.themes/github_themes
