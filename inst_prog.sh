#!/bin/bash

color() {
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

# DIR_TEMP_PROG="${HOME}"/temp/inst/prog
GIT_CLONE="https://github.com/ShvetsRoman/inst.git"

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
boot_dialog --notags --title "Install programs" --checklist "Выберите программы для установки." 20 90 13 \
	"pikaur" "PIKAUR - установщик пакетов из AUR" OFF \
	"font" "FONTs" OFF \
	"bspwm" "bspwm + Polybar + Rofi + Dunst + Picom + конфиг файлы (нужен pikaur)" OFF \
	"ly" "Install Ly - display manager" OFF \
	"zshtheme" "ZSH + THEMEs - Powerlevel10i (для установки нужен pikaur)" OFF \
	"nvim" "NeoVim - Консольный текстовый редактор + Themes (нужен pikaur)" OFF \
	"vim" "Vim - Консольный текстовый редактор + Themes" OFF \
	"po_kde" "Установка дополнительного ПО для KDE (для установки нужен pikaur)" OFF \
	"lf" "lf (list files) — консольный файловый менеджер (для установки нужен pikaur)" OFF \
	"themes" "Icons Themes" OFF \
	"avahi" "Установка AVAHI" OFF \
	"samba" "Установка SAMBA" OFF \
	"nvidiaopman" "Intell + nVidia Optimus Manager (для установки нужен pikaur)" OFF
progs="$DIALOG_RESULT"

## Отмена установки
if [[ $DIALOG_CODE -eq 1 ]]; then
	boot_dialog --title "Cancelled" --msgbox "\nScript был отменен по вашему запросу." 10 60
	exit 0
fi

# Kлонировать, если выбран хоть один пункт меню утановки программ
if [[ -n "$progs" ]]; then
	color green "[*] Cloning a repository - inst..."
	# Если папка temp есть, тогда удаляем.
	if [[ -d "${HOME}"/temp ]]; then
		# rm -rf ${HOME}/temp
		# color yellow "### Папка ~/temp удалена ###"
		# git clone https://github.com/ShvetsRoman/inst.git ${HOME}/temp/inst
		echo ""
	else
		git clone "${GIT_CLONE}" "${HOME}"/temp/inst
	fi
else
	color red "Выберите программы для установки."
	exit 0
fi

if [[ -f "${HOME}"/01_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/01_project/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
else
  color red "##################################"
  color red "Файл з PATH відсутній !!!"
  color red "##################################"
  sleep 5s
	exit 0
fi

### Установка программ ###
for action in $progs; do
	case "$action" in
	'"pikaur"')
		color green "[*] Installing pikaur..."
		sh "${DIR_TEMP_PROG}"/inst_pikaur.sh
		;;
	'"font"')
		color green "[*] Installing fonts..."
		sh "${DIR_TEMP_PROG}"/inst_font.sh
		;;
	'"bspwm"')
		color green "[*] Installing bspwm..."
		sh "${DIR_TEMP_PROG}"/inst_bspwm.sh
		;;
	'"ly"')
		color green "[*] Installing Ly..."
		sh "${DIR_TEMP_PROG}"/inst_ly.sh
		;;
	'"zshtheme"')
		color green "[*] Installing zsh_theme_powerlevel10k..."
		sh "${DIR_TEMP_PROG}"/inst_zsh_theme_powerlevel10k.sh
		;;
	'"nvim"')
		color green "[*] Installing nvim..."
		sh "${DIR_TEMP_PROG}"/inst_nvim.sh
		;;
	'"vim"')
		color green "[*] Installing vim..."
		sh "${DIR_TEMP_PROG}"/inst_vim.sh
		;;
	'"po_kde"')
		color green "[*] Installing po_kde..."
		sh "${DIR_TEMP_PROG}"/inst_po_kde.sh
		;;
	'"lf"')
		color green "[*] Installing LF..."
		sh "${DIR_TEMP_PROG}"/inst_lf.sh
		;;
	'"themes"')
		color green "[*] Installing Icons Themes..."
		sh "${DIR_TEMP_PROG}"/inst_themes.sh
		;;
	'"avahi"')
		color green "[*] Installing avahi..."
		sh "${DIR_TEMP_PROG}"/inst_avahi.sh
		;;
	'"samba"')
		color green "[*] Installing samba..."
		sh "${DIR_TEMP_PROG}"/inst_samba.sh
		;;
	'"nvidiaopman"')
		color green "[*] Installing nvidia_op_kde_arch..."
		sh "${DIR_TEMP_PROG}"/inst_nvidia_op_kde_arch.sh
		;;
	esac
done
