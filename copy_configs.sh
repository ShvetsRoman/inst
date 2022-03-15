#!/bin/bash
#set -e

DIR_HOME_CONF="${HOME}/.config" 
DIR_COPY_CONF="/run/media/notebook/media/project_sh/inst/prog/conf"
 
# Копирование config Neovim
if [[ -d ${DIR_HOME_CONF}/nvim/lua/custom ]]; then 
  echo -e "\n[*] Copy config Neovim..."
  rm -rf ${DIR_COPY_CONF}/nvim
  mkdir -p ${DIR_COPY_CONF}/nvim/lua 
  cp -r ${DIR_HOME_CONF}/nvim/lua/custom ${DIR_COPY_CONF}/nvim/lua/
fi 

# Copy config bspwm
if [[ -d ${DIR_HOME_CONF}/bspwm ]]; then 
  echo -e "\n[*] Copy config bspwm..."
  rm -rf ${DIR_COPY_CONF}/bspwm
  cp -r ${DIR_HOME_CONF}/bspwm ${DIR_COPY_CONF}/
fi 

# Copy config sxhkd
if [[ -d ${DIR_HOME_CONF}/sxhkd ]]; then 
  echo -e "\n[*] Copy config sxhkd..."
  rm -rf ${DIR_COPY_CONF}/sxhkd
  cp -r ${DIR_HOME_CONF}/sxhkd ${DIR_COPY_CONF}/
fi 

# Copy config Polybar
if [[ -d ${DIR_HOME_CONF}/polybar ]]; then 
  echo -e "\n[*] Copy config Polybar..."
  rm -rf ${DIR_COPY_CONF}/polybar
  cp -r ${DIR_HOME_CONF}/polybar ${DIR_COPY_CONF}/
fi 

# Copy config Rofi
if [[ -d ${DIR_HOME_CONF}/rofi ]]; then 
  echo -e "\n[*] Copy config Rofi..."
  rm -rf ${DIR_COPY_CONF}/rofi
  cp -r ${DIR_HOME_CONF}/rofi ${DIR_COPY_CONF}/
fi 

# Copy config Dunst
if [[ -d ${DIR_HOME_CONF}/dunst ]]; then 
  echo -e "\n[*] Copy config Dunst..."
  rm -rf ${DIR_COPY_CONF}/dunst
  cp -r ${DIR_HOME_CONF}/dunst ${DIR_COPY_CONF}/
fi 

# Copy config Picom
if [[ -d ${DIR_HOME_CONF}/picom ]]; then 
  echo -e "\n[*] Copy config Picom..."
  rm -rf ${DIR_COPY_CONF}/picom
  cp -r ${DIR_HOME_CONF}/picom ${DIR_COPY_CONF}/
fi 

# Copy config Alacritty (terminal)
if [[ -d ${DIR_HOME_CONF}/alacritty ]]; then 
  echo -e "\n[*] Copy config Alacritty..."
  rm -rf ${DIR_COPY_CONF}/alacritty
  cp -r ${DIR_HOME_CONF}/alacritty ${DIR_COPY_CONF}/
fi 

# Copy config LF (terminal-file-manager)
if [[ -d ${DIR_HOME_CONF}/lf ]]; then 
  echo -e "\n[*] Copy config LF..."
  rm -rf ${DIR_COPY_CONF}/lf
  cp -r ${DIR_HOME_CONF}/lf ${DIR_COPY_CONF}/
fi 
if [[ -d ${DIR_HOME_CONF}/lf-ueberzug ]]; then 
  echo -e "\n[*] Copy config lf-ueberzug..."
  rm -rf ${DIR_COPY_CONF}/lf-ueberzug
  cp -r ${DIR_HOME_CONF}/lf-ueberzug ${DIR_COPY_CONF}/
fi 

# Copy config Kvantum
if [[ -d ${DIR_HOME_CONF}/Kvantum ]]; then 
  echo -e "\n[*] Copy config Kvantum..."
  rm -rf ${DIR_COPY_CONF}/Kvantum
  cp -r ${DIR_HOME_CONF}/Kvantum ${DIR_COPY_CONF}/
fi 

# Copy environment & qt5ct
if [[ -d ${DIR_HOME_CONF}/qt5ct ]]; then 
  echo -e "\n[*] Copy config qt5ct..."
  rm -rf ${DIR_COPY_CONF}/qt5ct
  cp -r ${DIR_HOME_CONF}/qt5ct ${DIR_COPY_CONF}/
  cp -r /etc/environment ${DIR_COPY_CONF}/qt5ct/
fi 

# Copy config gtk-2.0
if [[ -d ${DIR_HOME_CONF}/gtk-2.0 ]]; then 
  echo -e "\n[*] Copy config gtk-2.0..."
  rm -rf ${DIR_COPY_CONF}/gtk-2.0
  cp -r ${DIR_HOME_CONF}/gtk-2.0 ${DIR_COPY_CONF}/
fi 

# Copy config gtk-3.0
if [[ -d ${DIR_HOME_CONF}/gtk-3.0 ]]; then 
  echo -e "\n[*] Copy config gtk-3.0..."
  rm -rf ${DIR_COPY_CONF}/gtk-3.0
  cp -r ${DIR_HOME_CONF}/gtk-3.0 ${DIR_COPY_CONF}/
fi 

# Copy config gtk-4.0
if [[ -d ${DIR_HOME_CONF}/gtk-4.0 ]]; then 
  echo -e "\n[*] Copy config gtk-4.0..."
  rm -rf ${DIR_COPY_CONF}/gtk-4.0
  cp -r ${DIR_HOME_CONF}/gtk-4.0 ${DIR_COPY_CONF}/
fi 

##################################################
############ copying configs from home ###########
##################################################
# Копирование config gtkrc-2.0
if [[ -f ${HOME}/.gtkrc-2.0 ]]; then 
  echo -e "\n[*] Copy config gtkrc-2.0..."
  rm -rf ${DIR_COPY_CONF}/gtkrc
  mkdir -p ${DIR_COPY_CONF}/gtkrc
  cp ${HOME}/.gtkrc-2.0 ${DIR_COPY_CONF}/gtkrc/
fi 

# Копирование config ZSH
if [[ -f ${HOME}/.zshrc ]]; then 
  echo -e "\n[*] Copy config ZSH..."
  rm -rf ${DIR_COPY_CONF}/zsh
  mkdir -p ${DIR_COPY_CONF}/zsh
  cp ${HOME}/.zshrc ${DIR_COPY_CONF}/zsh/
  cp ${HOME}/.zsh_alias ${DIR_COPY_CONF}/zsh/
  cp ${HOME}/.zsh_path ${DIR_COPY_CONF}/zsh/
  cp ${HOME}/.p10k.zsh ${DIR_COPY_CONF}/zsh/
  cp ${HOME}/.p10k-my-theme.zsh ${DIR_COPY_CONF}/zsh/
fi 

# Copy config .profile
if [[ -f ${HOME}/.profile ]]; then 
  echo -e "\n[*] Copy config .profile..."
  rm -rf ${DIR_COPY_CONF}/profile
  mkdir -p ${DIR_COPY_CONF}/profile
  cp ${HOME}/.profile ${DIR_COPY_CONF}/profile/
fi 

# Copy config .Xresources
if [[ -f ${HOME}/.Xresources ]]; then 
  echo -e "\n[*] Copy config .Xresources..."
  rm -rf ${DIR_COPY_CONF}/xresources
  mkdir -p ${DIR_COPY_CONF}/xresources
  cp ${HOME}/.Xresources ${DIR_COPY_CONF}/xresources/
fi 

# Copy config .xinitrc
if [[ -f ${HOME}/.xinitrc ]]; then 
  echo -e "\n[*] Copy config .xinitrc..."
  rm -rf ${DIR_COPY_CONF}/xinitrc
  mkdir -p ${DIR_COPY_CONF}/xinitrc
  cp ${HOME}/.xinitrc ${DIR_COPY_CONF}/xinitrc/
fi 

# Copy config .fehbg
if [[ -f ${HOME}/.fehbg ]]; then 
  echo -e "\n[*] Copy config .fehbg..."
  rm -rf ${DIR_COPY_CONF}/fehbg
  mkdir -p ${DIR_COPY_CONF}/fehbg
  cp ${HOME}/.fehbg ${DIR_COPY_CONF}/fehbg/
fi 

# Copy config pikaur
if [[ -f ${DIR_HOME_CONF}/pikaur.conf ]]; then 
  echo -e "\n[*] Copy config pikaur..."
  rm -rf ${DIR_COPY_CONF}/pikaur
  mkdir -p ${DIR_COPY_CONF}/pikaur
  cp ${DIR_HOME_CONF}/pikaur.conf ${DIR_COPY_CONF}/pikaur/
fi 
