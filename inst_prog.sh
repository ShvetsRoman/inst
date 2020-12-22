#!/bin/bash

## Функция меню диалога
boot_dialog() {
    DIALOG_RESULT=$(whiptail --clear --backtitle " INSTALL PROGRAMS Arch Linux & Manjaro Linux" "$@" 3>&1 1>&2 2>&3)
    DIALOG_CODE=$?
    if [[ $DIALOG_CODE -eq 1 ]]; then
        boot_dialog --title "Cancelled" --msgbox "\nScript was cancelled at your request." 10 60
        exit 0
    fi
}

## OS
#boot_dialog --title "OS" --menu "Укажите свою OS" 10 60 2 "1" "Arch linux" "2" "Manjaro"
#os="$DIALOG_RESULT"
os=$(cat /etc/issue | awk '{ print $1 }')

# Меню установки программ
boot_dialog --notags --title "Install programs" --checklist "Выберите программы для установки." 15 80 10 \
    "pikaur" "PIKAUR - установщик пакетов из AUR" ON \
    "po_kde" "Установка дополнительного ПО для KDE (для установки нужен pikaur)" ON \
    "avahi" "Установка AVAHI" OFF \
    "samba" "Установка SAMBA" OFF \
    "zsh" "ZSH - командная оболочка UNIX" ON \
    "zshtheme" "THEMEs ZSH - Powerlevel10i (для установки нужен pikaur)" ON \
    "nvidiaopman" "Intell + nVidia Optimus Manager (для установки нужен pikaur)" ON \
    "vim" "Vim - Консольный текстовый редактор + Themes" OFF \
    "nvim" "NeoVim - Консольный текстовый редактор + Themes" ON
    progs="$DIALOG_RESULT"

## Отмена установки
if [[ $DIALOG_CODE -eq 1 ]]; then
    boot_dialog --title "Cancelled" --msgbox "\nScript был отменен по вашему запросу." 10 60
    exit 0
fi

### Установка программ общие для Arch linux и Manjaro ###
sudo pacman -Syyuu
for action in $progs; do
    case "$action" in
        '"pikaur"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_pikaur.sh
            sh inst_pikaur.sh
            ;;
        '"po_kde"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_po_kde.sh
            sh inst_po_kde.sh
            ;;
        '"avahi"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_avahi.sh
            sh inst_avahi.sh
            ;;
        '"samba"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_samba.sh
            sh inst_samba.sh
            ;;
        '"zsh"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_zsh.sh
            sh inst_zsh.sh
            ;;
        '"zshtheme"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_zsh_theme_powerlevel10k.sh
            sh inst_zsh_theme_powerlevel10k.sh
            ;;
        '"vim"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_vim.sh
            sh inst_vim.sh
            ;;
        '"nvim"')
            mkdir ${HOME}/temp
            cd ${HOME}/temp
            curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_nvim.sh
            sh inst_nvim.sh
            ;;
    esac
done

### OS Arch linux ###
if [[ "$os" == "Arch" ]]; then
    # Установка программ
    for action in $progs; do
        case "$action" in
            '"nvidiaopman"')
                mkdir ${HOME}/temp
                cd ${HOME}/temp
                curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_nvidia_op_kde_arch.sh
                sh inst_nvidia_op_kde_arch.sh
                ;;
        esac
    done
fi

### OS Manjaro ###
if [[ "$os" == "Manjaro" ]]; then
    # Установка программ
    for action in $progs; do
        case "$action" in
            '"nvidiaopman"')
                mkdir ${HOME}/temp
                cd ${HOME}/temp
                curl -LO https://raw.githubusercontent.com/ShvetsRoman/test/main/prog/inst_nvidia_op_kde_manjaro.sh
                sh inst_nvidia_op_kde_manjaro.sh
                ;;
        esac
    done
fi

# Если папка ${HOME}/temp есть, тогда удаляем.
if [[ -e ${HOME}/temp ]]; then
    rm -r ${HOME}/temp
fi
