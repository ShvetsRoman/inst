#!/bin/bash
#set -e
 
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

##### INSTALL THEMEs #####
color green "[*] Installing Themes..."
# PlagueSur-icons-theme
color green "[*] Installing PlagueSur-icons-theme"
git clone https://github.com/PlagaMedicum/PlagueSur-icon-theme.git ~/.local/share/icons/PlagueSur
# Stylish-icon-theme
color green "[*] Installing PlagueSur-icons-theme"
git clone https://aur.archlinux.org/stylish-icon-theme.git ~/.local/share/icons/Stylish
# Infinity-icon-theme
color green "[*] Installing Infinity-icons-theme"
git clone https://github.com/rogts/infinity-icon-theme.git ~/.local/share/icons/Infinity

# Themes GitHub McMojave
mkdir -p "${HOME}"/.themes/github_themes/
cd "${HOME}"/.themes/github_themes/ || exit
## McMojave
color green "[*] Installing McMojave-kde"
git clone https://github.com/vinceliuice/McMojave-kde
sh "${HOME}"/.themes/github_themes/McMojave-kde/install.sh
color green "[*] Installing Mojave-gtk-theme"
git clone https://github.com/vinceliuice/Mojave-gtk-theme
sh "${HOME}"/.themes/github_themes/Mojave-gtk-theme/install.sh
color green "[*] Installing McMojave-circle"
git clone https://github.com/vinceliuice/McMojave-circle
sh "${HOME}"/.themes/github_themes/McMojave-circle/install.sh -t blue
## WhiteSur
color green "[*] Installing MhiteSur-kde"
git clone https://github.com/vinceliuice/WhiteSur-kde
sh "${HOME}"/.themes/github_themes/WhiteSur-kde/install.sh
color green "[*] Installing WhiteSur-gtk-theme"
pikaur -S mojave-gtk-theme-git
# git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
# sh "${HOME}"/.themes/github_themes/WhiteSur-gtk-theme/install.sh
color green "[*] Installing WhiteSur-icon-theme"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme
sh "${HOME}"/.themes/github_themes/WhiteSur-icon-theme/install.sh
rm -rf "${HOME}"/.themes/github_themes
