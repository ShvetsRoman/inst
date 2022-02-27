#!/bin/bash

DIR_TEMP_PROG="${HOME}/temp/inst/prog"
 
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
  "pikaur" "PIKAUR - установщик пакетов из AUR" ON \
  "po_kde" "Установка дополнительного ПО для KDE (для установки нужен pikaur)" OFF \
  "avahi" "Установка AVAHI" OFF \
  "samba" "Установка SAMBA" OFF \
  "zshtheme" "ZSH + THEMEs - Powerlevel10i (для установки нужен pikaur)" ON \
  "nvidiaopman" "Intell + nVidia Optimus Manager (для установки нужен pikaur)" OFF \
  "vim" "Vim - Консольный текстовый редактор + Themes" OFF \
  "nvim" "NeoVim - Консольный текстовый редактор + Themes (нужен pikaur)" ON \
  "bspwm" "bspwm + Polybar + Rofi + Dunst + Picom + конфиг файлы (нужен pikaur)" ON \
  "font" "FONTs" ON
  progs="$DIALOG_RESULT"

## Отмена установки
if [[ $DIALOG_CODE -eq 1 ]]; then
  boot_dialog --title "Cancelled" --msgbox "\nScript был отменен по вашему запросу." 10 60
  exit 0
fi
 
# Kлонировать, если выбран хоть один пункт меню утановки программ
if [[ -n "$progs" ]]; then
  echo -e "\n[*] Cloning a repository - inst..."
  # Если папка temp есть, тогда удаляем.
  if [[ -d "${HOME}/temp" ]]; then
    rm -rf ${HOME}/temp
    echo "### Папка ~/temp удалена ###"
  fi
  git clone https://github.com/ShvetsRoman/inst.git ${HOME}/temp/inst
else
  echo "Выберите программы для установки."
  exit 0
fi
 
### Установка программ ###
for action in $progs; do
  case "$action" in
    '"pikaur"')
      echo -e "\n[*] Installing pikaur..."
      sh ${DIR_TEMP_PROG}/inst_pikaur.sh
      ;;
    '"po_kde"')
      echo -e "\n[*] Installing po_kde..."
      sh ${DIR_TEMP_PROG}/inst_po_kde.sh
      ;;
    '"avahi"')
      echo -e "\n[*] Installing avahi..."
      sh ${DIR_TEMP_PROG}/inst_avahi.sh
      ;;
    '"samba"')
      echo -e "\n[*] Installing samba..."
      sh ${DIR_TEMP_PROG}/inst_samba.sh
      ;;
    '"zsh"')
      echo -e "\n[*] Installing zsh..."
      sh ${DIR_TEMP_PROG}/inst_zsh.sh
      ;;
    '"zshtheme"')
      echo -e "\n[*] Installing zsh_theme_powerlevel10k..."
      sh ${DIR_TEMP_PROG}/inst_zsh_theme_powerlevel10k.sh
      ;;
    '"nvidiaopman"')
      echo -e "\n[*] Installing nvidia_op_kde_arch..."
      sh ${DIR_TEMP_PROG}/inst_nvidia_op_kde_arch.sh
      ;;
    '"vim"')
      echo -e "\n[*] Installing vim..."
      sh ${DIR_TEMP_PROG}/inst_vim.sh
      ;;
    '"nvim"')
      echo -e "\n[*] Installing nvim..."
      sh ${DIR_TEMP_PROG}/inst_nvim.sh
      ;;
    '"bspwm"')
      echo -e "\n[*] Installing bspwm..."
      sh ${DIR_TEMP_PROG}/inst_bspwm.sh
      ;;
    '"font"')
      echo -e "\n[*] Installing fonts..."
      sh ${DIR_TEMP_PROG}/inst_font.sh
      ;;
  esac
done

# Если папка temp есть, тогда удаляем.
# if [[ -e "${HOME}/temp" ]]; then
#     rm -rf ${HOME}/temp
#     echo "### Папка ~/temp удалена ###"
# fi
