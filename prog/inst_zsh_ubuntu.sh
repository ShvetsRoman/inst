#!/bin/bash

BASEDIR=$(dirname $(realpath "$0"))
echo $BASEDIR

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

# zsh
color green "[*] Installing ZSH..."
sudo apt install zsh
chsh -s $(which zsh)
sudo apt install exa grc

# Install Theme ZSH
color green "[*] Installing Theme ZSH..."
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k

color green "[*] Installing zsh-completions from shells:zsh-users:zsh-completions project"
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-completions.gpg > /dev/null
sudo apt update
sudo apt install zsh-completions

color green "[*] Installing zsh-syntax-highlighting"
sudo apt install zsh-syntax-highlighting

color green "[*] Installing zsh-autosuggestions from shells:zsh-users:zsh-autosuggestions project"
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null
sudo apt update
sudo apt install zsh-autosuggestions

# Copy config
color green "[*] Copy config ZSH..."
cp -rfv "${BASEDIR}"/conf/zsh/. "${HOME}"/

# Install configs ROOT
color green "[*] Install configs ROOT ZSH..."
sudo cp -rfv "${BASEDIR}"/conf/zsh/. /root/

# Установка Zsh в качестве оболочки по умолчанию
color green "[*] Установка Zsh в качестве оболочки по умолчанию..."
sudo chsh -s /bin/zsh "${USER}"
sudo chsh -s /bin/zsh root
