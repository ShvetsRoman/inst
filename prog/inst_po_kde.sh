#!/bin/bash
#set -e

### Core_packages ###
core_packages=''

core_packages_aur=''

### Install PACMAN ###
# KDE 
core_packages+=' packagekit-qt5 libappindicator-gtk2 libappindicator-gtk3 colord-kde kaccounts-integration kaccounts-providers kdeconnect kdenetwork-filesharing kwalletmanager'

# Latte-dock
core_packages+=' latte-dock'

# Kvantum
core_packages+=' kvantum'

# Dolphin
core_packages+=' dolphin-plugins kompare kdegraphics-thumbnailers kimageformats qt5-imageformats kdesdk-thumbnailers ffmpegthumbs taglib audiocd-kio kio-gdrive'

# Torrent
core_packages+=' ktorrent'

# Browser
#core_packages+=' firefox firefox-i18n-ru'

# Image viewer
core_packages+=' gwenview gimp inkscape okular'

# Video, Audio
core_packages+=' ffmpeg ffmpegthumbnailer vlc'

# General utilities/libraries
core_packages+=' neofetch git openssh p7zip unace unrar unzip ark mc htop gparted kcalc'

# Office
core_packages+=' libreoffice-still libreoffice-still-ru'

### end packages pacman ###

### Install AUR ###

core_packages_aur+=' deadbeef google-chrome raw-thumbnailer'

### end packages aur ###

### INSTALL Programs ###
sudo pacman -Syyuu --noconfirm --needed $core_packages
pikaur -S --noconfirm --noedit $core_packages_aur

### Themes
mkdir -p ${HOME}/.themes/github_themes/
cd ${HOME}/.themes/github_themes/
## McMojave
# McMojave KDE
git clone https://github.com/vinceliuice/McMojave-kde
sh ${HOME}/.themes/github_themes/McMojave-kde/install.sh
# McMojave GTK-KDE
git clone https://github.com/vinceliuice/Mojave-gtk-theme
sh ${HOME}/.themes/github_themes/Mojave-gtk-theme/install.sh
# McMojave Icon Theme
git clone https://github.com/vinceliuice/McMojave-circle
sh ${HOME}/.themes/github_themes/McMojave-circle/install.sh -blue

## PlagueSur icon themes
git clone https://github.com/PlagaMedicum/PlagueSur-icon-theme.git ~/.local/share/icons/PlagueSur-icon-theme

## WhiteSur
# WhiteSur-kde
git clone https://github.com/vinceliuice/WhiteSur-kde
sh ${HOME}/.themes/github_themes/WhiteSur-kde/install.sh
# WhiteSur-gtk-theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
sh ${HOME}/.themes/github_themes/WhiteSur-gtk-theme/install.sh
# WhiteSur-icon-theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme
sh ${HOME}/.themes/github_themes/WhiteSur-icon-theme/install.sh
