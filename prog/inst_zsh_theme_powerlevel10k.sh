#!/bin/bash

DIR_TEMP_CONF="${HOME}/temp/inst/prog/conf"
 
# Установка ZSH
echo -e "\n[*] Installing ZSH..."
sudo pacman -S --noconfirm --needed zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
 
# Install Theme ZSH
echo -e "\n[*] Installing Theme ZSH..."
pikaur -S --noconfirm --noedit zsh-theme-powerlevel10k-git
 
# Install Font 
echo -e "\n[*] Installing Font ZSH..."
pikaur -S --noconfirm --noedit ttf-meslo-nerd-font-powerlevel10k
 
# Delete .bashrc
echo -e "\n[*] Delete .bashrc & .bash*..."
if [[ -f "${HOME}/.bashrc" ]]; then
  rm -r ${HOME}/.bash*
fi

# Backup .zshrc
echo -e "\n[*] Installing Backup .zshrc..."
if [[ -f "${HOME}/.zshrc" ]]; then
    mv ${HOME}/.zshrc ${HOME}/.zshrc.bak
fi
if [[ -f "${HOME}/.zsh_alias" ]]; then
    mv ${HOME}/.zsh_alias ${HOME}/.zsh_alias.bak
fi
if [[ -f "${HOME}/.zsh_path" ]]; then
    mv ${HOME}/.zsh_path ${HOME}/.zsh_path.bak
fi
if [[ -f "${HOME}/.p10k.zsh" ]]; then
    mv ${HOME}/.p10k.zsh ${HOME}/.p10k.zsh.bak
fi

# Copy config
echo -e "\n[*] Copy config ZSH..."
cp -rfv ${DIR_TEMP_CONF}/zsh/. ${HOME}/

# Install configs ROOT
echo -e "\n[*] Install configs ROOT ZSH..."
cp -rfv ${DIR_TEMP_CONF}/zsh/. /root/

# Установка Zsh в качестве оболочки по умолчанию
echo -e "\n[*] Установка Zsh в качестве оболочки по умолчанию..."
sudo chsh -s /bin/zsh ${USER}
sudo chsh -s /bin/zsh root
