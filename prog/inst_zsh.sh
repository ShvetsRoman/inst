#!/bin/bash

# Установка GIT
sudo pacman -S --noconfirm --needed git

# Установка шриштов
git clone https://github.com/powerline/fonts.gitss
cd fonts
./install.sh
cd ..
rm -rf fonts

# Backup .zshrc
if [[ -e ${HOME}/.zshrc ]]; then
    mv ${HOME}/.zshrc ${HOME}/.zshrc.bak
fi
if [[ -e ${HOME}/.zsh_alias ]]; then
    mv ${HOME}/.zsh_alias ${HOME}/.zsh_alias.bak
fi

# Установка ZSH
sudo pacman -S --noconfirm --needed zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions

# Копирование config .zshrc
cd ${HOME}/
wget https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/zshrc
mv ${HOME}/zshrc ${HOME}/.zshrc
wget https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/zsh_alias
mv ${HOME}/zsh_alias ${HOME}/.zsh_alias

# Копирование config .zshrc ROOT
sudo cp ${HOME}/.zshrc /root/
sudo cp ${HOME}/.zsh_alias /root/

# Установка Zsh в качестве оболочки по умолчанию
sudo chsh -s /bin/zsh $USER
sudo chsh -s /bin/zsh root

#source ${HOME}/.zshrc
