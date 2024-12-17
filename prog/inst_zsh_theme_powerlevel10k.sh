#!/bin/bash

if [[ -f "${HOME}"/00_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/00_project/sh/inst/prog/source_dir.sh
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

# Установка ZSH
color green "[*] Installing ZSH..."
sudo pacman -S --noconfirm --needed zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
# Дополнительное ПО
sudo pacman -S --noconfirm --needed exa grc
 
# Install Theme ZSH
color green "[*] Installing Theme ZSH..."
pikaur -S --noconfirm --noedit zsh-theme-powerlevel10k-git
 
# Install Font 
color green "[*] Installing Font ZSH..."
pikaur -S --noconfirm --noedit ttf-meslo-nerd-font-powerlevel10k
 
# Delete .bashrc
color green "[*] Delete .bashrc & .bash*..."
if [[ -f "${HOME}"/.bashrc ]]; then
  rm -r "${HOME}"/.bash*
fi

# Backup .zshrc
color green "[*] Installing Backup .zshrc..."
if [[ -f "${HOME}"/.zshrc ]]; then
    mv "${HOME}"/.zshrc "${HOME}"/.zshrc.bak
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
if [[ -f "${HOME}"/.p10k.zsh ]]; then
    mv "${HOME}"/.p10k.zsh "${HOME}"/.p10k.zsh.bak
fi

# Copy config
color green "[*] Copy config ZSH..."
cp -rfv "${DIR_TEMP_CONF}"/zsh/. "${HOME}"/

# Install configs ROOT
color green "[*] Install configs ROOT ZSH..."
sudo cp -rfv "${DIR_TEMP_CONF}"/zsh/. /root/

# Установка Zsh в качестве оболочки по умолчанию
color green "[*] Установка Zsh в качестве оболочки по умолчанию..."
sudo chsh -s $(which zsh) "${USER}"
sudo chsh -s $(which zsh) root
