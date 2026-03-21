#!/bin/bash

# Визначити абсолютний шлях до директорії, де лежить цей скрипт
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR_CONF="${SCRIPT_DIR}"/conf

# HOME .config
HOME_DIR_CONF="${HOME}"/.config

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

# Установка ZSH
color green "[*] Installing ZSH..."
sudo pacman -S --noconfirm --needed zsh zsh-completions zsh-syntax-highlighting zsh-autocomplete zsh-autosuggestions
sudo pacman -S --noconfirm --needed starship
# Дополнительное ПО
sudo pacman -S --noconfirm --needed eza grc bat television
 
# Delete .bashrc
color green "[*] Delete .bashrc & .bash*..."
if [[ -f "${HOME}"/.bashrc ]]; then
rm -r "${HOME}"/.bash*
fi

if [[ -f "${HOME}"/.zsh_alias ]]; then
    mv "${HOME}"/.zsh_alias "${HOME}"/.zsh_alias.bak
fi
if [[ -f "${HOME}"/.zsh_path ]]; then
    mv "${HOME}"/.zsh_path "${HOME}"/.zsh_path.bak
fi
if [[ -f "${HOME}"/.zsh_icons ]]; then
    mv "${HOME}"/.zsh_icons "${HOME}"/.zsh_icons.bak
fi

# Copy config
color green "[*] Copy config ZSH..."
cp -rfv "${SCRIPT_DIR_CONF}"/zsh/. "${HOME}"/
cp -rfv "${SCRIPT_DIR_CONF}"/starship "${HOME_DIR_CONF}"/

# Install configs ROOT
color green "[*] Install configs ROOT ZSH..."
cp -rfv "${SCRIPT_DIR_CONF}"/zsh/. /root
if [[ -d /root/.config ]]; then
  color green "[*] /root/.config існює..."
else
  sudo mkdir /root/.config/
fi
sudo cp -rfv "${SCRIPT_DIR_CONF}"/starship /root/.config

# Установка Zsh в качестве оболочки по умолчанию
color green "[*] Установка Zsh в качестве оболочки по умолчанию..."
sudo chsh -s $(which zsh) "${USER}"
sudo chsh -s $(which zsh) root
