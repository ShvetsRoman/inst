#!/bin/bash

# Copy font
# Konsole: Open Settings → Edit Current Profile → Appearance, click Select Font and select MesloLGS NF Regular
mkdir ${HOME}/.fonts
cd ${HOME}/.fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Backup .zshrc
if [[ -e ${HOME}/.zshrc ]]; then
    mv ${HOME}/.zshrc ${HOME}/.zshrc.bak
fi
if [[ -e ${HOME}/.zsh_alias ]]; then
    mv ${HOME}/.zsh_alias ${HOME}/.zsh_alias.bak
fi
if [[ -e ${HOME}/.p10k.zsh ]]; then
    mv ${HOME}/.p10k.zsh ${HOME}/.p10k.zsh.bak
fi

# Install Theme
#sudo pacman -S --noconfirm zsh-theme-powerlevel10k
pikaur -S --noedit zsh-theme-powerlevel10k-git

# Copy configs
cd ${HOME}/
wget https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/zshrc_theme
mv ${HOME}/zshrc_theme ${HOME}/.zshrc
wget https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/zsh_alias
mv ${HOME}/zsh_alias ${HOME}/.zsh_alias
wget https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/zsh_p10k.zsh
mv ${HOME}/zsh_p10k.zsh ${HOME}/.p10k.zsh

# Install configs ROOT
sudo cp ${HOME}/.zshrc /root/
sudo cp ${HOME}/.zsh_alias /root/
sudo cp ${HOME}/.p10k.zsh /root/

#source ${HOME}/.zshrc
