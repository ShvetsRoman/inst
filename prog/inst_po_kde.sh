#!/bin/bash
#set -e

### Install PACMAN ###
# KDE 
sudo pacman -Syu --noconfirm --needed packagekit-qt5 libappindicator-gtk2 colord-kde kaccounts-integration kaccounts-providers kdeconnect kdenetwork-filesharing kwalletmanager

# Latte-dock
# sudo pacman -Syu --noconfirm --needed latte-dock

# Kvantum
sudo pacman -Syu --noconfirm --needed kvantum

# Dolphin
sudo pacman -Syu --noconfirm --needed dolphin-plugins kompare kimageformats qt5-imageformats kdesdk-thumbnailers ffmpegthumbs taglib audiocd-kio kio-gdrive

# Torrent
sudo pacman -Syu --noconfirm --needed ktorrent

# Browser
#sudo pacman -Syu --noconfirm --needed firefox firefox-i18n-ru

# Image viewer
sudo pacman -Syu --noconfirm --needed gwenview gimp inkscape okular

# Video, Audio
sudo pacman -Syu --noconfirm --needed ffmpeg ffmpegthumbnailer vlc

# General utilities/libraries
sudo pacman -Syu --noconfirm --needed fastfetch git openssh p7zip unace unrar unzip ark mc htop gparted kcalc

# Office
sudo pacman -Syu --noconfirm --needed libreoffice-still libreoffice-still-uk
### end packages pacman ###

### Install AUR ###
# pikaur -S deadbeef google-chrome
pikaur -S  google-chrome
pikaur -S  sayonara-player
