#!/bin/bash

# Copy font
# Konsole: Open Settings → Edit Current Profile → Appearance, click Select Font and select MesloLGS NF Regular
curl -fLo ${HOME}/.fonts/MesloLGS%20NF%20Regular.ttf --create-dirs https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -fLo ${HOME}/.fonts/MesloLGS%20NF%20Bold.ttf --create-dirs https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -fLo ${HOME}/.fonts/MesloLGS%20NF%20Italic.ttf --create-dirs https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -fLo ${HOME}/.fonts/MesloLGS%20NF%20Bold%20Italic.ttf --create-dirs https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

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
curl -fLo ${HOME}/.zshrc --create-dirs https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/conf/zshrc_theme
curl -fLo ${HOME}/.zsh_alias --create-dirs https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/conf/zsh_alias
curl -fLo ${HOME}/.p10k.zsh --create-dirs https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/conf/zsh_p10k.zsh

# Install configs ROOT
sudo cp ${HOME}/.zshrc /root/
sudo cp ${HOME}/.zsh_alias /root/
sudo cp ${HOME}/.p10k.zsh /root/

# Установка Zsh в качестве оболочки по умолчанию
sudo chsh -s /bin/zsh ${USER}
sudo chsh -s /bin/zsh root
