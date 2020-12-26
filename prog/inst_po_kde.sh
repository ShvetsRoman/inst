#!/bin/bash

### Core_packages ###
core_packages=''

core_packages_aur=''

### Install PACMAN ###
# KDE 
core_packages+=' packagekit-qt5 libappindicator-gtk2 libappindicator-gtk3 colord-kde kaccounts-integration kaccounts-providers kdeconnect kdenetwork-filesharing'

# Latte-dock
core_packages+=' latte-dock'

# Kvantum
core_packages+=' kvantum-qt5'

# Dolphin
core_packages+=' dolphin-plugins kompare kdegraphics-thumbnailers kimageformats qt5-imageformats kdesdk-thumbnailers ffmpegthumbs raw-thumbnailer taglib audiocd-kio kio-gdrive'

# Torrent
core_packages+=' ktorrent'

# Browser
core_packages+=' firefox firefox-i18n-ru'

# Image viewer
core_packages+=' gwenview gimp inkscape okular'

# Video, Audio
core_packages+=' ffmpeg ffmpegthumbnailer vlc deadbeef'

# General utilities/libraries
core_packages+=' neofetch git openssh p7zip unace unrar unzip ark mc htop gparted vim kcalc'

# Office
core_packages+=' libreoffice-still libreoffice-still-ru'

### end packages pacman ###

### Install AUR ###

core_packages_aur+=' '

### end packages aur ###

### INSTALL Programs ###
sudo pacman -Syyuu --noconfirm --needed $core_packages
pikaur -S --noconfirm --noedit $core_packages_aur

# Themes GitHub McMojave-kde
mkdir -r ${HOME}/.themes/github_themes/
cd ${HOME}/.themes/github_themes/

git clone https://github.com/vinceliuice/McMojave-kde
${HOME}/.themes/github_themes/McMojave-kde/install.sh

git clone https://github.com/vinceliuice/Mojave-gtk-theme
${HOME}/.themes/github_themes/Mojave-gtk-theme/install.sh

git clone https://github.com/vinceliuice/McMojave-circle
${HOME}/.themes/github_themes/McMojave-circle/install.sh -blue
