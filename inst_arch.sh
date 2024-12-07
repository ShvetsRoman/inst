#!/bin/bash

set -ue
# exec > inst_arch_error.log 2>&1

timedatectl set-ntp true
hwclock -w
loadkeys ru
setfont cyr-sun16

gitinst=https://raw.githubusercontent.com/ShvetsRoman/inst/main

# linux-headers
is_intel_cpu=$(lscpu | grep 'Intel' &>/dev/null && echo 'yes' || echo '')
#nvme
nvme=$(ls -l /dev/ | grep -E "nvme" &>/dev/null && echo 'yes' || echo '')

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

clear

## Dialog function
boot_dialog() {
	DIALOG_RESULT=$(whiptail --clear --backtitle " Arch Linux (GRUB && SYSTEMD-BOOT EFI)" "$@" 3>&1 1>&2 2>&3)
	DIALOG_CODE=$?
	if [[ $DIALOG_CODE -eq 1 ]]; then
		boot_dialog --title "Cancelled" --msgbox "\nСкрипт был отменен по вашему запросу." 10 60
		exit 0
	fi
}

## Welcome
boot_dialog --title "ArchLinux" --yesno "  Для установки Arch Linux (Только EFI) на файловую систему GPT форматированую в EXT4 или BTRFS с загрузчиком GRUB или SYSTEMD-BOOT, нажми <ДА>." 10 60

## File systems
boot_dialog --title "File systems" --menu "" 10 60 2 "1" "EXT4" "2" "BTRFS"
fs="$DIALOG_RESULT"

#UEFI
boot_dialog --title "Size UEFI" --menu "Укажите размер раздела EFI" 10 60 3 "512" "M" "1024" "M" "2048" "M"
uefisize="$DIALOG_RESULT"

#SWAP
boot_dialog --title "SWAP" --menu "Нужен раздел SWAP ?" 10 60 2 "1" "ДА" "2" "НЕТ"
swapinstall="$DIALOG_RESULT"

## UEFI / SYSTEMD-BOOT
boot_dialog --title "UEFI boot loaders" --menu "" 10 60 2 "1" "GRUB" "2" "SYSTEMD-BOOT"
bl="$DIALOG_RESULT"

## Display drivers
boot_dialog --title "Display drivers" --menu "" 20 60 6 "1" "INTEL" "2" "ATI" "3" "AMD" "4" "NVIDIA" "5" "VIRTUALBOX"
dd="$DIALOG_RESULT"

## Desktop environment
boot_dialog --title "Desktop environment" --menu "" 10 60 4 "1" "KDE" "2" "XFCE" "3" "MATE" "4" "BSPWM" "5" "БЕЗ DE"
de="$DIALOG_RESULT"

## Username Hostname
boot_dialog --title "User name" --inputbox "Пожалуйста, введите имя user.\n" 10 60
username="$DIALOG_RESULT"
hostname="$username"-pc

## Password ROOT & USER
boot_dialog --title "Root password" --inputbox "Пожалуйста, введите пароль для root user.\n" 10 60
root_password="$DIALOG_RESULT"

boot_dialog --title "User password" --inputbox "Пожалуйста, введите пароль для user.\n" 10 60
user_password="$DIALOG_RESULT"

## Disk format
lsblk_f=$(lsblk)
if [[ -n "$nvme" ]]; then
	boot_dialog --title "Disk" --inputbox "\n$lsblk_f\n\nПожалуйста, введите диск для разметки и форматирования.\nНапример nvme0n1\n\n" 25 60 nvme0n1
	df=$DIALOG_RESULT
	dfd="$df""p"
	lsblk_dev=$(lsblk /dev/"$df")
else
	boot_dialog --title "Disk" --inputbox "\n$lsblk_f\n\nПожалуйста, введите диск для разметки и форматирования.\nНапример sda\n\n" 25 60 sda
	df=$DIALOG_RESULT
	dfd="$df"
	lsblk_dev=$(lsblk /dev/"$df")
fi

#SSD_HDD
ssd_hdd=$(cat /sys/block/"$df"/queue/rotational)
partitions=$(cat /proc/partitions | grep -w "$df" | awk '{ print $3 }')
if [[ "$ssd_hdd" = "0" ]]; then
	partitions=$(("$partitions" * 90 / 100 / 1000))
fi
if [[ "$ssd_hdd" = "1" ]]; then
	partitions=$(("$partitions" / 1000))
fi

# Swap size
if [[ "$swapinstall" == "1" ]]; then
	swapsize=$(cat /proc/meminfo | grep MemTotal | awk '{ print $2 }')
	swapsize=$(("$swapsize" / 1000 + 1024))
else
	swapsize=0
fi

#EXT4 выбор разделов на диске
if [[ "$fs" == "1" ]]; then
	boot_dialog --notags --title "EXT4" --checklist "Выберите разделы на диске.\nРаздел '/' обязательный." 15 60 6 \
		"/" "/" ON \
		"tmp" "/tmp" OFF \
		"var" "/var" OFF \
		"var_tmp" "/var/tmp" OFF \
		"var_pkg" "/var/cache/pacman/pkg" OFF \
		"home" "/home" ON
	fsdisk="$DIALOG_RESULT"

	usedsize=$(("$partitions" - ("$uefisize" + "$swapsize")))
	boot_dialog --title "Size /" --inputbox "$lsblk_dev\n\nПожалуйста, введите размер для раздела '/' в мегабайтах (M).\n\nОстаток свободного места $usedsize\n\nНапример 102400\n" 20 60 102400
	korsize="$DIALOG_RESULT"
	usedsize=$(("$partitions" - ("$uefisize" + "$swapsize" + "$korsize")))

	for action in $fsdisk; do
		case "$action" in
		'"tmp"')
			boot_dialog --title "Size tmp" --inputbox "$lsblk_dev\n\nПожалуйста, введите размер для раздела 'tmp' в мегабайтах (M).\n\nНапример 102400\n\nОстаток свободного места $usedsize\n\nРекомендуемый размер 5120\n" 20 60 5120
			tmpsize="$DIALOG_RESULT"
			usedsize=$(("$partitions" - ("$uefisize" + "$swapsize" + "$korsize" + "$tmpsize")))
			;;
		'"var"')
			boot_dialog --title "Size var" --inputbox "$lsblk_dev\n\nПожалуйста, введите размер для раздела 'var' в мегабайтах (M).\n\nНапример 102400\n\nОстаток свободного места $usedsize\n\nРекомендуемый размер 20480\n" 20 60 20480
			varsize="$DIALOG_RESULT"
			usedsize=$(("$partitions" - ("$uefisize" + "$swapsize" + "$korsize" + "$tmpsize" + "$varsize")))
			;;
		'"var_tmp"')
			boot_dialog --title "Size var_tmp" --inputbox "$lsblk_dev\n\nПожалуйста, введите размер для раздела 'var_tmp' в мегабайтах (M).\n\nНапример 102400\n\nОстаток свободного места $usedsize\n\nРекомендуемый размер 2560\n" 20 60 2560
			var_tmpsize="$DIALOG_RESULT"
			usedsize=$(("$partitions" - ("$uefisize" + "$swapsize" + "$korsize" + "$tmpsize" + "$varsize" + "$var_tmpsize")))
			;;
		'"var_pkg"')
			boot_dialog --title "Size var_pkg" --inputbox "$lsblk_dev\n\nПожалуйста, введите размер для раздела 'var_pkg' в мегабайтах (M).\n\nНапример 102400\n\nОстаток свободного места $usedsize\n\nРекомендуемый размер 10240\n" 20 60 10240
			var_pkgsize="$DIALOG_RESULT"
			usedsize=$(("$partitions" - ("$uefisize" + "$swapsize" + "$korsize" + "$tmpsize" + "$varsize" + "$var_tmpsize" + "$var_pkgsize")))
			;;
		'"home"')
			boot_dialog --title "Size home" --inputbox "$lsblk_dev\n\nПожалуйста, введите размер для раздела 'home' в мегабайтах (M).\n\nНапример 102400\n\nРекомендуемый размер $usedsize\n" 20 60 $usedsize
			homesize="$DIALOG_RESULT"
			;;
		esac
	done
fi

#BTRFS выбор разделов на диске
if [[ "$fs" == "2" ]]; then
	boot_dialog --title "Create BTRFS subvolumes" --checklist "Выберите подтома BTRFS на диске.\nРаздел '@' обязательный." 15 60 7 \
		"@" "/" ON \
		"@home" "/home" ON \
		"@snapshots" "/.snapshots" ON \
		"@tmp" "/tmp" OFF \
		"@var" "/var" OFF \
		"@var_tmp" "/var/tmp" OFF \
		"@var_pkg" "/var/cache/pacman/pkg" OFF
	fsdisk="$DIALOG_RESULT"
	usedsize=$(("$partitions" - ("$uefisize" + "$swapsize")))
	korsize="$usedsize"
fi

## Localtime
region="Europe"
city="Kyiv"

## Locale
locale="ru_UA"

## Keymap
keymap="ru"

## Font
font="cyr-sun16"

## Warning
boot_dialog --title "WARNING" --yesno "\nВы решили удалить все разделы (ВСЕ ДАННЫЕ) на следующих дисках:/dev/$df.\nНажмите <Да> для продолжения или <Нет> для отмены.\n" 10 60
clear

## Cancelled install
if [[ $DIALOG_CODE -eq 1 ]]; then
	boot_dialog --title "Cancelled" --msgbox "\nСкрипт был отменен по вашему запросу." 10 60
	exit 0
fi

## Partitions
color green "[***] Partitions..."
sgdisk -Z /dev/"$df"          #очиска диска
parted /dev/"$df" mklabel gpt #таблица разделов GPT
lsblk                         #инфо
color green "[***] INFO..."
fdisk -l /dev/"$df" #инфо
sleep 5s

# FORMAT EFI
color green "[***] FORMAT EFI..."
volume_efi=/dev/"$dfd""1"
sgdisk /dev/"$df" -n=1:0:+"$uefisize"M -t=1:ef00 --change-name=1:"efi"
mkfs.vfat -F32 -n EFI "$volume_efi"

# FORMAT EXT4
if [[ "$fs" == "1" ]]; then
	color green "[***] FORMAT EXT4..."
	volume_new=1
	# SWAP
	if [[ "$swapinstall" = "1" ]]; then
		volume_new=$(("$volume_new" + 1))
		volume_swap=/dev/"$dfd""$volume_new"
		sgdisk /dev/"$df" -n="$volume_new":0:+"$swapsize"M -t="$volume_new":8200 --change-name="$volume_new":"swap"
	fi
	# /
	volume_new=$(("$volume_new" + 1))
	volume_root=/dev/"$dfd""$volume_new"
	sgdisk /dev/"$df" -n="$volume_new":0:+"$korsize"M -t="$volume_new":8304 --change-name="$volume_new":"arch"
	mkfs.ext4 -L ROOT "$volume_root"
	# home tmp ....
	for action in $fsdisk; do
		case "$action" in
		'"tmp"')
			volume_new=$(("$volume_new" + 1))
			volume_tmp=/dev/"$dfd""$volume_new"
			sgdisk /dev/"$df" -n="$volume_new":0:+"$tmpsize"M -t="$volume_new":8300 --change-name="$volume_new":"tmp"
			mkfs.ext4 -L TMP "$volume_tmp"
			;;
		'"var"')
			volume_new=$(("$volume_new" + 1))
			volume_var=/dev/"$dfd""$volume_new"
			sgdisk /dev/"$df" -n="$volume_new":0:+"$varsize"M -t="$volume_new":8310 --change-name="$volume_new":"var"
			mkfs.ext4 -L VAR "$volume_var"
			;;
		'"var_tmp"')
			volume_new=$(("$volume_new" + 1))
			volume_var_tmp=/dev/"$dfd""$volume_new"
			sgdisk /dev/"$df" -n="$volume_new":0:+"$var_tmpsize"M -t="$volume_new":8311 --change-name="$volume_new":"var_tmp"
			mkfs.ext4 -L VAR_TMP "$volume_var_tmp"
			;;
		'"var_pkg"')
			volume_new=$(("$volume_new" + 1))
			volume_var_pkg=/dev/"$dfd""$volume_new"
			sgdisk /dev/"$df" -n="$volume_new":0:+"$var_pkgsize"M -t="$volume_new":8300 --change-name="$volume_new":"var_pkg"
			mkfs.ext4 -L VAR_PKG "$volume_var_pkg"
			;;
		'"home"')
			volume_new=$(("$volume_new" + 1))
			volume_home=/dev/"$dfd""$volume_new"
			if [[ "$ssd_hdd" = "0" ]]; then
				sgdisk /dev/"$df" -n="$volume_new":0:+"$homesize"M -t="$volume_new":8302 --change-name="$volume_new":"home"
			else
				sgdisk /dev/"$df" -n="$volume_new":0:0 -t="$volume_new":8302 --change-name="$volume_new":"home"
			fi
			mkfs.ext4 -L HOME "$volume_home"
			;;
		esac
	done
fi

# MOUNT EXT4
if [[ "$fs" == "1" ]]; then
	color green "[***] MOUNT EXT4..."
	volume_new=1
	# SWAP
	if [[ "$swapinstall" = "1" ]]; then
		volume_new=$(("$volume_new" + 1))
		volume_swap=/dev/"$dfd""$volume_new"
		mkswap -L SWAP "$volume_swap"
		swapon "$volume_swap"
	fi
	# /
	volume_new=$(("$volume_new" + 1))
	volume_root=/dev/"$dfd""$volume_new"
	mount "$volume_root" /mnt
	# EFI
	mkdir -p /mnt/boot
	mount "$volume_efi" /mnt/boot
	# home tmp ....
	for action in $fsdisk; do
		case "$action" in
		'"tmp"')
			volume_new=$(("$volume_new" + 1))
			volume_tmp=/dev/"$dfd""$volume_new"
			mkdir -p /mnt/tmp
			mount "$volume_tmp" /mnt/tmp
			;;
		'"var"')
			volume_new=$(("$volume_new" + 1))
			volume_var=/dev/"$dfd""$volume_new"
			mkdir -p /mnt/var
			mount "$volume_var" /mnt/var
			;;
		'"var_tmp"')
			volume_new=$(("$volume_new" + 1))
			volume_var_tmp=/dev/"$dfd""$volume_new"
			mkdir -p /mnt/var/tmp
			mount "$volume_var_tmp" /mnt/var/tmp
			;;
		'"var_pkg"')
			volume_new=$(("$volume_new" + 1))
			volume_var_pkg=/dev/"$dfd""$volume_new"
			mkdir -p /mnt/var/cache/pacman/pkg
			mount "$volume_var_pkg" /mnt/var/cache/pacman/pkg
			;;
		'"home"')
			volume_new=$(("$volume_new" + 1))
			volume_home=/dev/"$dfd""$volume_new"
			mkdir -p /mnt/home
			mount "$volume_home" /mnt/home
			;;
		esac
	done
	root_systemd=" root=UUID=$(blkid -s UUID -o value "${volume_root}")"
	btrfs_progs=" "
fi

#Partitions BTRFS
if [[ "$fs" == "2" ]]; then
	color green "[***] Partitions BTRFS..."
	if [[ "$swapinstall" = "1" ]]; then
		volume_swap=/dev/"$dfd""2"
		sgdisk /dev/"$df" -n=2:0:+"$swapsize"M -t=2:8200
		if [[ "$ssd_hdd" = "0" ]]; then
			sgdisk /dev/"$df" -n=3:0:+"$korsize"M -t=3:8300
		else
			sgdisk /dev/"$df" -n=3:0:0 -t=3:8300
		fi
		volume_root=/dev/"$dfd""3"
	else
		if [[ "$ssd_hdd" = "0" ]]; then
			sgdisk /dev/"$df" -n=2:0:+"$korsize"M -t=2:8300
		else
			sgdisk /dev/"$df" -n=2:0:0 -t=2:8300
		fi
		volume_root=/dev/"$dfd""2"
	fi
fi

# Format BTRFS
if [[ "$fs" == "2" ]]; then
	mkfs.btrfs -f -L ARCH "$volume_root"
fi

#Subvolumes BTRFS
if [[ "$fs" == "2" ]]; then
	color green "[***] Subvolumes BTRFS..."
	# /
	mount "$volume_root" /mnt
	btrfs subvolume create /mnt/@
	for action in $fsdisk; do
		case "$action" in
		'"@home"')
			btrfs subvolume create /mnt/@home
			;;
		'"@snapshots"')
			btrfs subvolume create /mnt/@snapshots
			;;
		'"@tmp"')
			btrfs subvolume create /mnt/@tmp
			;;
		'"@var"')
			btrfs subvolume create /mnt/@var
			;;
		'"@var_tmp"')
			btrfs subvolume create /mnt/@var_tmp
			;;
		'"@var_pkg"')
			btrfs subvolume create /mnt/@var_pkg
			;;
		esac
	done
	color green "[***] Subvolumes list..."
	btrfs subvolume list /mnt
	btrfs sub set-default /mnt
	umount /mnt
fi

#Mount BTRFS
if [[ "$fs" == "2" ]]; then
	color green "[***] Mount BTRFS..."
	mount -o compress=zstd,noatime,ssd,subvol=@ "$volume_root" /mnt

	if [[ "$swapinstall" = "1" ]]; then
		volume_swap=/dev/"$dfd""2"
		mkswap -L SWAP "$volume_swap"
		swapon "$volume_swap"
	fi

	mkdir -p /mnt/boot
	mount "$volume_efi" /mnt/boot

	for action in $fsdisk; do
		case "$action" in
		'"@home"')
			mkdir -p /mnt/home
			mount -o compress=zstd,noatime,ssd,subvol=@home "$volume_root" /mnt/home
			;;
		'"@snapshots"')
			mkdir - p /mnt/.snapshots
			mount -o compress=zstd,noatime,ssd,subvol=@snapshots "$volume_root" /mnt/.snapshots
			;;
		'"@tmp"')
			mkdir -p /mnt/tmp
			mount -o compress=zstd,noatime,ssd,subvol=@tmp "$volume_root" /mnt/tmp
			;;
		'"@var"')
			mkdir -p /mnt/var
			mount -o compress=zstd,noatime,ssd,subvol=@var "$volume_root" /mnt/var
			;;
		'"@var_tmp"')
			mkdir -p /mnt/var/tmp
			mount -o compress=zstd,noatime,ssd,subvol=@var_tmp "$volume_root" /mnt/var/tmp
			;;
		'"@var_pkg"')
			mkdir -p /mnt/var/cache/pacman/pkg
			mount -o compress=zstd,noatime,ssd,subvol=@var_pkg "$volume_root" /mnt/var/cache/pacman/pkg
			;;
		esac
	done
	btrfs_progs=" btrfs-progs"
	root_systemd=" root=UUID=$(blkid -s UUID -o value "${volume_root}") rootflags=subvol=@"
fi
root_uuid="${root_systemd}"

## Core_packages
core_packages=''

# BTRFS
if [[ "$fs" == "2" ]]; then
	 core_packages+=' btrfs-progs'
fi

## DISPLAY DRIVER
# Intel
if [[ "$dd" = "1" ]]; then
	core_packages+=' mesa xf86-video-intel'
fi

# Ati for older cards
if [[ "$dd" = "2" ]]; then
	core_packages+=' xf86-video-ati'
fi

# Amdgpu for newer cards
if [[ "$dd" = "3" ]]; then
	core_packages+=' xf86-video-amdgpu'
fi

# Nvidia
if [[ "$dd" = "4" ]]; then
	core_packages+=' xf86-video-nouveau'
fi

# Virtualbox
if [[ "$dd" = "5" ]]; then
	core_packages+=' virtualbox-guest-utils'
fi

## DESKTOP ENVIRONMENT
# Desktop environment KDE
if [[ "$de" = "1" ]]; then
	core_packages+=' plasma plasma-pa plasma-nm'
	# Dolphin
	core_packages+=' dolphin'
	# Konsole
	core_packages+=' konsole alacritty'
	# Kate
	core_packages+=' kate'
	# QT
	core_packages+=' qt5ct kvantum'
	# QT_Thems
	core_packages+=' breeze papirus-icon-theme'
	# Display manager
	core_packages+=' sddm'
	display_manager=" sddm.service"
fi

# Desktop environment XFCE
if [[ "$de" = "2" ]]; then
	core_packages+=' xfce4 xfce4-goodies'
	# Display manager
	core_packages+=' lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings'
	display_manager=" lightdm.service"
fi

# Desktop environment MATE
if [[ "$de" = "3" ]]; then
	core_packages+=' mate mate-extra'
	# Display manager
	core_packages+=' lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings'
	display_manager=" lightdm.service"
fi

# Desktop environment BSPWM
if [[ "$de" = "4" ]]; then
	# BSPWM
	core_packages+=' bspwm sxhkd dmenu'
	# Display manager
	core_packages+=' lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings'
	display_manager=" lightdm.service"
	# General utilities/libraries
	core_packages+=' numlockx udiskie'
	# GTK
	core_packages+=' gtk2 gtk3 dconf-editor lxappearance librsvg'
	# GTK_Thems
	core_packages+=' breeze-gtk'
	# QT
	core_packages+=' qt5ct kvantum'
	# QT_Thems
	core_packages+=' breeze papirus-icon-theme'
	# Konsole
	core_packages+=' alacritty'
	# Firefox
	# core_packages+=' firefox firefox-i18n-ru'
	# File manager
	# core_packages+=' pcmanfm gvfs'
fi

# БЕЗ DE
if [[ "$de" = "5" ]]; then
	core_packages+=' xterm xsel mesa lib32-mesa xf86-input-libinput xdg-user-dirs dialog gvfs-afc gvfs-mtp exfat-utils ntfs-3g sshfs wget curl git flatpak xbindkeys neofetch openssh p7zip unace unrar unzip ark htop xautolock hwinfo'
	# NETWORK
	core_packages+=' openresolv iwd'
	# Управление энергопотреблением
	core_packages+=' powerdevil'
	# Python билиотеки
	core_packages+=' python-requests python-dbus python-pip python-pipenv'
fi

if [[ "$de" != "5" ]]; then
	# Xserver
	core_packages+=' xorg xorg-apps xorg-xinit'
	# General utilities/libraries
	core_packages+=' xterm xsel mesa lib32-mesa xf86-input-libinput xdg-user-dirs dialog gvfs-afc gvfs-mtp exfat-utils ntfs-3g sshfs wget curl git flatpak xbindkeys neofetch openssh p7zip unace unrar unzip ark htop xautolock hwinfo'
	# NETWORK
	core_packages+=' networkmanager networkmanager-openvpn wpa_supplicant openresolv iwd'
	# Управление энергопотреблением
	core_packages+=' powerdevil'
	# Audio
	core_packages+=' pulseaudio pulseaudio-alsa pavucontrol alsa-utils'
	# Печать
	core_packages+=' print-manager cups system-config-printer'
	# Image viewer
	core_packages+=' gwenview gimp inkscape imagemagick feh scrot'
	# Video, Audio
	core_packages+=' playerctl ffmpeg ffmpegthumbnailer vlc'
	# Office
	core_packages+=' libreoffice-still libreoffice-still-ru'
	# Fonts
	core_packages+=' ttf-dejavu ttf-liberation ttf-freefont noto-fonts awesome-terminal-fonts ttf-font-awesome'
	# Python билиотеки
	core_packages+=' python-requests python-dbus python-pip python-pipenv'
	# BG
	core_packages+=' archlinux-wallpaper'
fi

# linux-headers
if [[ -n "$is_intel_cpu" ]]; then
	# https://wiki.archlinux.org/index.php/microcode
	core_packages+=' intel-ucode'
fi

## Mirrorlist
color green "[***] Mirrorlist..."
reflector --verbose -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist
color green "[***] ArchLinux keyring..."
pacman -Syy --noconfirm --needed archlinux-keyring

##################
## INSTALL BASE ##
##################
color green "[***] Install BASE System..."
pacstrap /mnt base base-devel linux linux-firmware bash-completion pacman-contrib

# Generate fstab
color green "[***] Generate fstab..."
genfstab -U -p /mnt >>/mnt/etc/fstab

color green "[***] Hostname, localtime, locale, vconsole, username, sudo..."
# Hostname, localtime, locale, vconsole, username, sudo
arch-chroot /mnt /bin/bash <<EOF
echo "$hostname" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 '$hostname'.localdomain '$hostname'" >> /etc/hosts
ln -svf /usr/share/zoneinfo/"$region"/"$city" /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "$locale"".UTF-8 UTF-8" >> /etc/locale.gen
echo 'LANG="'$locale'.UTF-8"' > /etc/locale.conf
echo 'KEYMAP='$keymap'' >> /etc/vconsole.conf
echo 'FONT='$font'' >> /etc/vconsole.conf
locale-gen
echo "root:$root_password" | chpasswd
useradd -m -g users -G wheel -s /bin/bash $username
echo "$username:$user_password" | chpasswd
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers
EOF

# Pacman multilib
color green "[***] Pacman config & multilib..."
arch-chroot /mnt /bin/bash <<EOF
sed -i "s/^#VerbosePkgLists/ILoveCandy\\nVerbosePkgLists/g" /etc/pacman.conf
sed -i "s/^#Color/Color/g" /etc/pacman.conf
sed -i '/^#\[multilib\]/{n;s/^#Include.*/Include = \/etc\/pacman.d\/mirrorlist/g}' /etc/pacman.conf
sed -i 's/^#\[multilib\]/\[multilib\]/g' /etc/pacman.conf
EOF

## INSTALL PACKAGES ##
color green "[***] INSTALL PACKAGES..."
arch-chroot /mnt /bin/bash <<EOF
pacman -Syu --noconfirm --needed $core_packages
EOF

# GRUB
if [[ "$bl" = "1" ]]; then
	color green "[***] Install GRUB..."
	arch-chroot /mnt /bin/bash <<EOF
pacman -Syu --noconfirm grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
EOF
fi

#GRUB+btrfs
if [[ "$bl" = "1" && "$fs" = "2" ]]; then
	color green "[***] Install GRUB+btrfs..."
	arch-chroot /mnt /bin/bash <<EOF
pacman -Syu --noconfirm grub-btrfs
grub-mkconfig -o /boot/grub/grub.cfg
EOF
fi

#GRUB+btrfs snapshot
if [[ "$bl" = "1" && "$fs" = "2" ]]; then
	color green "[***] GRUB+btrfs snapshot..."
	arch-chroot /mnt /bin/bash <<'EOF'
pacman -Syu --noconfirm cronie
cat << 'snap-shot' > /usr/local/bin/btrfs-snapshot
#!/bin/bash

# Parse arguments:
SOURCE=$1
TARGET=$2
SNAP=$3
COUNT=$4
QUIET=$5

# Basic argument checks:
if [ -z "$COUNT" ] ; then
  echo "COUNT не вказано."
fi
if [ ! -z "$6" ] ; then
  echo "Надто багато варіантів."
fi
if [ -n "$QUIET" ] && [ "x$QUIET" != "x-q"	] ; then
  echo "Option 4 is either -q or empty. Given: \"$QUIET\""
fi

# $max_snap це найбільша кількість знімків, які зберігатимуться $SNAP.
max_snap=$COUNT

# Створити новий snapshot:
cmd="btrfs subvolume snapshot $SOURCE $TARGET/$(date --iso-8601=seconds)-@${SNAP}"
if [ -z "$QUIET" ]; then
  echo "$cmd"
  $cmd
else
  $cmd >/dev/null
fi

# Прибирати старше snapshots:
for i in $(find "$TARGET" -maxdepth 1|sort |grep @"${SNAP}"\$|head -n -${max_snap}); do
  cmd="btrfs subvolume delete $i"
  if [ -z "$QUIET" ]; then
    echo "$cmd"
    $cmd
  else
    $cmd >/dev/null
  fi
done

snap-shot
chmod +x /usr/local/bin/btrfs-snapshot
chown -R $username:users /usr/local/bin/btrfs-snapshot

cat << 'anacron-tab' > /etc/anacrontab
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

1    5  daily_snap      /usr/local/bin/btrfs-snapshot / /.snapshots daily 8
7   10  weekly_snap     /usr/local/bin/btrfs-snapshot / /.snapshots weekly 5
30  15  monthly_snap    /usr/local/bin/btrfs-snapshot / /.snapshots monthly 3
1   20  grub_mkconfig   grub-mkconfig
anacron-tab
chmod +x /etc/anacrontab
chown -R $username:users /etc/anacrontab
EOF
fi

# GRUB + Virtualbox
if [[ "$bl" = "1" && "$dd" = "5" ]]; then
	color green "[***] GRUB + Virtualbox..."
	arch-chroot /mnt /bin/bash <<EOF
mkdir /boot/EFI/boot
cp /boot/EFI/arch/grubx64.efi /boot/EFI/boot/bootx64.efi
EOF
fi

## SYSTEMD-BOOT
if [[ "$bl" = "2" ]]; then
	color green "[***] SYSTEMD-BOOT..."
	arch-chroot /mnt /bin/bash <<EOF
bootctl install

cat << LINUX > /boot/loader/entries/arch.conf
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options ${root_uuid} rw quiet splash
LINUX

cat << LINUXFL > /boot/loader/entries/arch-fallback.conf
title Arch Linux Fallback
linux /vmlinuz-linux
initrd /initramfs-linux-fallback.img
options ${root_uuid} rw quiet splash
LINUXFL

cat << MENU > /boot/loader/loader.conf
default arch
timeout 1
editor 0
console-mode max
MENU
EOF
fi

# SYSTEMD-BOOT + INTEL CPU
if [[ "$bl" = "2" && -n "$is_intel_cpu" ]]; then
	color green "[***] SYSTEMD-BOOT + INTEL CPU..."
	arch-chroot /mnt /bin/bash <<EOF
sed -i "s/^initrd.*/initrd \/intel-ucode.img\\ninitrd \/initramfs-linux.img/g" /boot/loader/entries/arch.conf
sed -i "s/^initrd.*/initrd \/intel-ucode.img\\ninitrd \/initrd \/initramfs-linux-fallback.img/g" /boot/loader/entries/arch-fallback.conf
EOF
fi

# Автоматизация процесса обновления SYSTEMD-BOOT
if [[ "$bl" = "2" ]]; then
	color green "[***] Автоматизация процесса обновления SYSTEMD-BOOT..."
	arch-chroot /mnt /bin/bash <<EOF
mkdir -p /etc/pacman.d/hooks/
cat << 'hook' > /etc/pacman.d/hooks/systemd-boot.hook
[Trigger]
Type = Package
Operation = Upgrade
Target = systemd

[Action]
Description = Updating systemd-boot...
When = PostTransaction
Exec = /usr/bin/bootctl update
hook
EOF
fi

## mkinitcpio + btrfs
if [[ "$fs" = "2" ]]; then
	color green "[***] mkinitcpio + btrfs..."
	arch-chroot /mnt /bin/bash <<EOF
sed -i 's/^BINARIES=.*/BINARIES=(\/usr\/bin\/btrfs)/g' /etc/mkinitcpio.conf
sed -i 's/^HOOKS=.*/HOOKS=(base udev autodetect modconf block filesystems keyboard keymap consolefont fsck btrfs)/g' /etc/mkinitcpio.conf
mkinitcpio -p linux
EOF
fi

# Копирование скрипта inst_prog_base.sh на рабочий стол для установки pikaur, zsh, nVidia_optimus_manager...
color green "[***] Копирование скрипта inst_prog_base.sh..."
arch-chroot /mnt /bin/bash <<EOF
mkdir /home/$username/
curl -fLo /home/$username/inst_prog.sh $gitinst/inst_prog.sh
chmod +x /home/$username/inst_prog.sh
chown -R $username:users /home/$username/inst_prog.sh
EOF

# Игнорировать закрытие крышки ноутбука
color green "[***] Отключение HandleLidSwitch..."
arch-chroot /mnt /bin/bash <<EOF
echo '' >> /etc/systemd/logind.conf
echo 'HandleLidSwitch=ignore' >> /etc/systemd/logind.conf
EOF

# Numlock on KDE
if [[ "$de" = "1" ]]; then
	color green "[***] Numlock on KDE..."
	arch-chroot /mnt /bin/bash <<EOF
echo '[General]' > /etc/sddm.conf
echo 'Numlock=on' >> /etc/sddm.conf
EOF
fi

# Nunlock ON
if [[ "$de" = "4" ]]; then
	color green "[***] Nunlock ON..."
	arch-chroot /mnt /bin/bash <<'EOF'
cat << 'num_lock_on' > /usr/local/bin/numlock
#!/bin/bash

for tty in /dev/tty{1..6}
do
  /usr/bin/setleds -D +num < "$tty";
done
num_lock_on
chmod +x /usr/local/bin/numlock

cat << 'num_lock_service' > /etc/systemd/system/numlock.service
[Unit]
Description=numlock

[Service]
ExecStart=/usr/local/bin/numlock
StandardInput=tty
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
num_lock_service
EOF
fi

# BSPWM + Copy config BSPWM
if [[ "$de" = "4" ]]; then
	color green "[***] EXEC BSPWM + Copy config BSPWM..."
	arch-chroot /mnt /bin/bash <<EOF
echo 'sxhkd &' >> /home/$username/.xinitrc
echo 'exec bspwm' >> /home/$username/.xinitrc
chown $username:users /home/$username/.xinitrc
chmod +x /home/$username/.xinitrc
mkdir -p /home/$username/.config/{bspwm,sxhkd}
cp /usr/share/doc/bspwm/examples/bspwmrc /home/$username/.config/bspwm/bspwmrc
cp /usr/share/doc/bspwm/examples/sxhkdrc /home/$username/.config/sxhkd/sxhkdrc
chmod +x /home/$username/.config/bspwm/bspwmrc
chown -R $username:users /home/$username/.config
sed -i 's/urxvt/alacritty/g' /home/$username/.config/sxhkd/sxhkdrc
sed -i 's/@space/d/g' /home/$username/.config/sxhkd/sxhkdrc
EOF
fi

# LightDM BSPWM
if [[ "$de" = "4" ]]; then
	color green "[***] LightDM BSPWM..."
	arch-chroot /mnt /bin/bash <<EOF
echo '[greeter]' >> /etc/lightdm/lightdm-gtk-greeter.conf
echo 'theme-name = Breeze-Dark' >> /etc/lightdm/lightdm-gtk-greeter.conf
echo 'icon-theme-name = breeze-dark' >> /etc/lightdm/lightdm-gtk-greeter.conf
echo 'background = #11121D' >> /etc/lightdm/lightdm-gtk-greeter.conf
echo '[Desktop]' >> /home/$username/.dmrc
echo 'Session=bspwm' >> /home/$username/.dmrc
chown -R $username:users /home/$username/.dmrc
EOF
fi

# БЕЗ DE
if [[ "$de" = "5" ]]; then
	arch-chroot /mnt /bin/bash <<EOF
cat << 'iwd_conf' > /etc/iwd/main.conf
[Scan]
DisablePeriodicScan=true

[General]
EnableNetworkConfiguration=true

[Network]
EnableIPv6=false
NameResolvingService=resolvconf
iwd_conf

resolvconf -u
EOF
fi

#  ENABLE Service
color green "[***] ENABLE Service..."
if [[ "$de" != "5" ]]; then
	arch-chroot /mnt /bin/bash <<EOF
systemctl enable$display_manager
systemctl enable NetworkManager.service
EOF
fi
if [[ "$de" = "5" ]]; then
	arch-chroot /mnt /bin/bash <<EOF
systemctl enable iwd.service
EOF
fi
arch-chroot /mnt /bin/bash <<EOF
systemctl enable iptables.service
systemctl enable paccache.timer
EOF

#ENABLE Service Numlock BSPWM
if [[ "$de" = "4" ]]; then
	color green "[***] ENABLE Service Numlock..."
	arch-chroot /mnt /bin/bash <<EOF
systemctl enable numlock.service
EOF
fi

#ENABLE Service GRUB+btrfs Cronie
if [[ "$bl" = "1" && "$fs" = "2" ]]; then
	color green "[***] ENABLE Service grub-btrfs && Cronie..."
	arch-chroot /mnt /bin/bash <<EOF
systemctl enable grub-btrfsd.service
systemctl enable cronie.service
EOF
fi

color yellow "[*****] Скрипт завершил установку Arch Linux."
color red "Введите в терминале:"
color red "umount -R /mnt"
color red "reboot"
