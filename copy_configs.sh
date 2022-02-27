#!/bin/bash
#set -e

DIR_HOME_CONF="${HOME}/.config" 
DIR_COPY_CONF="/run/media/notebook/MEDIA/project_sh/inst/prog/conf"
 
# Копирование config Neovim
echo -e "\n[*] Copy config Neovim..."
rm -rf ${DIR_COPY_CONF}/nvim/lua
mkdir -p ${DIR_COPY_CONF}/nvim/lua 
cp -r ${DIR_HOME_CONF}/nvim/lua/custom ${DIR_COPY_CONF}/nvim/lua/

# Copy config bspwm
echo -e "\n[*] Copy config bspwm..."
rm -rf ${DIR_COPY_CONF}/bspwm 
cp -r ${DIR_HOME_CONF}/bspwm ${DIR_COPY_CONF}/

# Copy config sxhkd
echo -e "\n[*] Copy config sxhkd..."
rm -rf ${DIR_COPY_CONF}/sxhkd 
cp -r ${DIR_HOME_CONF}/sxhkd ${DIR_COPY_CONF}/

# Copy config i3
# echo -e "\n[*] Copy config i3..."
# rm -rf ${DIR_COPY_CONF}/i3 
# cp -r ${DIR_HOME_CONF}/i3 ${DIR_COPY_CONF}/

# Copy config i3status
# echo -e "\n[*] Copy config i3status..."
# rm -rf ${DIR_COPY_CONF}/i3status
# cp -r ${DIR_HOME_CONF}/i3status ${DIR_COPY_CONF}/
 
# Copy config Polybar
echo -e "\n[*] Copy config Polybar..."
rm -rf ${DIR_COPY_CONF}/polybar
cp -r ${DIR_HOME_CONF}/polybar ${DIR_COPY_CONF}/

# Copy config Rofi
echo -e "\n[*] Copy config Rofi..."
rm -rf ${DIR_COPY_CONF}/rofi
cp -r ${DIR_HOME_CONF}/rofi ${DIR_COPY_CONF}/

# Copy config Dunst
echo -e "\n[*] Copy config Dunst..."
rm -rf ${DIR_COPY_CONF}/dunst
cp -r ${DIR_HOME_CONF}/dunst ${DIR_COPY_CONF}/

# Copy config Picom
echo -e "\n[*] Copy config Picom..."
rm -rf ${DIR_COPY_CONF}/picom
cp -r ${DIR_HOME_CONF}/picom ${DIR_COPY_CONF}/

# Copy config Alacritty (terminal)
echo -e "\n[*] Copy config Alacritty..."
rm -rf ${DIR_COPY_CONF}/alacritty
cp -r ${DIR_HOME_CONF}/alacritty ${DIR_COPY_CONF}/

# copy config LY (Display-manager)
# echo -e "\n[*] Copy config LY..."
# rm -rf ${DIR_COPY_CONF}/ly
# cp -r /etc/ly ${DIR_COPY_CONF}/
# rm ${DIR_COPY_CONF}/ly/save

# Copy config LF (terminal-file-manager)
echo -e "\n[*] Copy config LF..."
rm -rf ${DIR_COPY_CONF}/lf
cp -r ${DIR_HOME_CONF}/lf ${DIR_COPY_CONF}/
echo -e "\n[*] Copy config lf-ueberzug..."
rm -rf ${DIR_COPY_CONF}/lf-ueberzug
cp -r ${DIR_HOME_CONF}/lf-ueberzug ${DIR_COPY_CONF}/

# Copy config Kvantum
echo -e "\n[*] Copy config Kvantum..."
rm -rf ${DIR_COPY_CONF}/Kvantum
cp -r ${DIR_HOME_CONF}/Kvantum ${DIR_COPY_CONF}/

# Copy environment & qt5ct
echo -e "\n[*] Copy config qt5ct..."
rm -rf ${DIR_COPY_CONF}/qt5ct
cp -r ${DIR_HOME_CONF}/qt5ct ${DIR_COPY_CONF}/
cp -r /etc/environment ${DIR_COPY_CONF}/qt5ct/
 
# Copy config gtk-2.0
echo -e "\n[*] Copy config gtk-2.0..."
rm -rf ${DIR_COPY_CONF}/gtk-2.0
cp -r ${DIR_HOME_CONF}/gtk-2.0 ${DIR_COPY_CONF}/

# Copy config gtk-3.0
echo -e "\n[*] Copy config gtk-3.0..."
rm -rf ${DIR_COPY_CONF}/gtk-3.0
cp -r ${DIR_HOME_CONF}/gtk-3.0 ${DIR_COPY_CONF}/

# Copy config gtk-4.0
echo -e "\n[*] Copy config gtk-4.0..."
rm -rf ${DIR_COPY_CONF}/gtk-4.0
cp -r ${DIR_HOME_CONF}/gtk-4.0 ${DIR_COPY_CONF}/

##################################################
############ copying configs from home ###########
##################################################
# Копирование config gtkrc-2.0
echo -e "\n[*] Copy config gtkrc-2.0..."
rm -rf ${DIR_COPY_CONF}/gtkrc
mkdir -p ${DIR_COPY_CONF}/gtkrc
cp ${HOME}/.gtkrc-2.0 ${DIR_COPY_CONF}/gtkrc/
 
# Копирование config ZSH
echo -e "\n[*] Copy config ZSH..."
rm -rf ${DIR_COPY_CONF}/zsh
mkdir -p ${DIR_COPY_CONF}/zsh
cp ${HOME}/.zshrc ${DIR_COPY_CONF}/zsh/
cp ${HOME}/.zsh_alias ${DIR_COPY_CONF}/zsh/
cp ${HOME}/.zsh_path ${DIR_COPY_CONF}/zsh/
cp ${HOME}/.p10k.zsh ${DIR_COPY_CONF}/zsh/
cp ${HOME}/.p10k-my-theme.zsh ${DIR_COPY_CONF}/zsh/

# Copy config .profile
echo -e "\n[*] Copy config .profile..."
rm -rf ${DIR_COPY_CONF}/profile
mkdir -p ${DIR_COPY_CONF}/profile
cp ${HOME}/.profile ${DIR_COPY_CONF}/profile/

# Copy config .Xresources
echo -e "\n[*] Copy config .Xresources..."
rm -rf ${DIR_COPY_CONF}/xresources
mkdir -p ${DIR_COPY_CONF}/xresources
cp ${HOME}/.Xresources ${DIR_COPY_CONF}/xresources/

# Copy config .xinitrc
echo -e "\n[*] Copy config .xinitrc..."
rm -rf ${DIR_COPY_CONF}/xinitrc
mkdir -p ${DIR_COPY_CONF}/xinitrc
cp ${HOME}/.xinitrc ${DIR_COPY_CONF}/xinitrc/
 
# Copy config .fehbg
echo -e "\n[*] Copy config .fehbg..."
rm -rf ${DIR_COPY_CONF}/fehbg
mkdir -p ${DIR_COPY_CONF}/fehbg
cp ${HOME}/.fehbg ${DIR_COPY_CONF}/fehbg/

# Copy config pikaur
echo -e "\n[*] Copy config pikaur..."
rm -rf ${DIR_COPY_CONF}/pikaur
mkdir -p ${DIR_COPY_CONF}/pikaur
cp ${DIR_HOME_CONF}/pikaur.conf ${DIR_COPY_CONF}/pikaur/
