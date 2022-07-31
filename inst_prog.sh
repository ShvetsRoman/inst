#!/bin/bash

DIR_TEMP_PROG="${HOME}/temp/inst/prog"
 
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

## Функция меню диалога
boot_dialog() {
  DIALOG_RESULT=$(whiptail --clear --backtitle " INSTALL PROGRAMS Arch Linux" "$@" 3>&1 1>&2 2>&3)
  DIALOG_CODE=$?
  if [[ $DIALOG_CODE -eq 1 ]]; then
    boot_dialog --title "Cancelled" --msgbox "\nScript was cancelled at your request." 10 60
    exit 0
  fi
}

# Меню установки программ
boot_dialog --notags --title "Install programs" --checklist "Выберите программы для установки." 15 90 10 \
  "pikaur" "PIKAUR - установщик пакетов из AUR" OFF \
  "po_kde" "Установка дополнительного ПО для KDE (для установки нужен pikaur)" OFF \
  "avahi" "Установка AVAHI" OFF \
  "samba" "Установка SAMBA" OFF \
  "zshtheme" "ZSH + THEMEs - Powerlevel10i (для установки нужен pikaur)" OFF \
  "nvidiaopman" "Intell + nVidia Optimus Manager (для установки нужен pikaur)" OFF \
  "vim" "Vim - Консольный текстовый редактор + Themes" OFF \
  "nvim" "NeoVim - Консольный текстовый редактор + Themes (нужен pikaur)" OFF \
  "bspwm" "bspwm + Polybar + Rofi + Dunst + Picom + конфиг файлы (нужен pikaur)" OFF \
  "font" "FONTs" OFF
  progs="$DIALOG_RESULT"

## Отмена установки
if [[ $DIALOG_CODE -eq 1 ]]; then
  boot_dialog --title "Cancelled" --msgbox "\nScript был отменен по вашему запросу." 10 60
  exit 0
fi
 
# Kлонировать, если выбран хоть один пункт меню утановки программ
if [[ -n "$progs" ]]; then
  clolor green "[*] Cloning a repository - inst..."
  # Если папка temp есть, тогда удаляем.
  if [[ -d "${HOME}/temp" ]]; then
    rm -rf ${HOME}/temp
    color yellow "### Папка ~/temp удалена ###"
  fi
  git clone https://github.com/ShvetsRoman/inst.git ${HOME}/temp/inst
else
  color red "Выберите программы для установки."
  exit 0
fi
 
### Установка программ ###
for action in $progs; do
  case "$action" in
    '"pikaur"')
      clolor green "[*] Installing pikaur..."
      sh ${DIR_TEMP_PROG}/inst_pikaur.sh |& tee ~/temp_install_log/inst_pikaur.log
      ;;
    '"po_kde"')
      clolor green "[*] Installing po_kde..."
      sh ${DIR_TEMP_PROG}/inst_po_kde.sh |& tee ~/temp_install_log/inst_po_kde.log
      ;;
    '"avahi"')
      clolor green "[*] Installing avahi..."
      sh ${DIR_TEMP_PROG}/inst_avahi.sh |& tee ~/temp_install_log/inst_avahi.log
      ;;
    '"samba"')
      clolor green "[*] Installing samba..."
      sh ${DIR_TEMP_PROG}/inst_samba.sh |& tee ~/temp_install_log/inst_samba.log
      ;;
    '"zsh"')
      clolor green "[*] Installing zsh..."
      sh ${DIR_TEMP_PROG}/inst_zsh.sh |& tee ~/temp_install_log/inst_zsh.log
      ;;
    '"zshtheme"')
      clolor green "[*] Installing zsh_theme_powerlevel10k..."
      sh ${DIR_TEMP_PROG}/inst_zsh_theme_powerlevel10k.sh |& tee ~/temp_install_log/inst_zsh_theme_powerlevel10k.log
      ;;
    '"nvidiaopman"')
      clolor green "[*] Installing nvidia_op_kde_arch..."
      sh ${DIR_TEMP_PROG}/inst_nvidia_op_kde_arch.sh |& tee ~/temp_install_log/inst_nvidia_op_kde_arch.log
      ;;
    '"vim"')
      clolor green "[*] Installing vim..."
      sh ${DIR_TEMP_PROG}/inst_vim.sh |& tee ~/temp_install_log/inst_vim.log
      ;;
    '"nvim"')
      clolor green "[*] Installing nvim..."
      sh ${DIR_TEMP_PROG}/inst_nvim.sh |& tee ~/temp_install_log/inst_nvim.log
      ;;
    '"bspwm"')
      clolor green "[*] Installing bspwm..."
      sh ${DIR_TEMP_PROG}/inst_bspwm.sh |& tee ~/temp_install_log/inst_bspwm.log
      ;;
    '"font"')
      clolor green "[*] Installing fonts..."
      sh ${DIR_TEMP_PROG}/inst_font.sh |& tee ~/temp_install_log/inst_font.log
      ;;
  esac
done

# Если папка temp есть, тогда удаляем.
if [[ -e "${HOME}/temp" ]]; then
  rm -rf ${HOME}/temp
  color yellow "### Папка ~/temp удалена ###"
fi
