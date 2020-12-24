#!/bin/bash

# Установка ZSH
sudo pacman -S --noconfirm --needed zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions

# Установка шриштов
git clone https://github.com/powerline/fonts.gitss
cd fonts
./install.sh
cd ..
rm -rf fonts

# Копирование config .zshrc
curl -fLo ${HOME}/.zshrc --create-dirs https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/zshrc
curl -fLo ${HOME}/.zsh_alias --create-dirs https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/zsh_alias

# Копирование config .zshrc ROOT
sudo cp ${HOME}/.zshrc /root/
sudo cp ${HOME}/.zsh_alias /root/

# Установка Zsh в качестве оболочки по умолчанию
sudo chsh -s /bin/zsh ${USER}
sudo chsh -s /bin/zsh root
