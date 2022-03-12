#!/bin/bash
#set -e

# KDE Arch
# Настройка SDDM & MODULES для корректной работы Optimus-manager
sudo sed -i 's/^DisplayCommand/#DisplayCommand/g' /etc/sddm.conf
sudo sed -i 's/^DisplayStopCommand/#DisplayStopCommand/g' /etc/sddm.conf
sudo sed -i 's/^MODULES=.*/MODULES=(i915)/g' /etc/mkinitcpio.conf

# Установка драйвера intell & Nvidia
sudo pacman -S --noconfirm --needed xf86-video-intel nvidia nvidia-utils nvidia-settings cuda lib32-nvidia-utils bbswitch
sudo nvidia-modprobe

# Установка Optimus Manager
pikaur -S --noconfirm --noedit optimus-manager
# Устанока утилиты для настройки графики и для переключения
pikaur -S --noconfirm --noedit optimus-manager-qt

# Обновление RAM запись
sudo mkinitcpio -P

# Добавляем сервис в автозагрузку
sudo systemctl enable optimus-manager
sudo systemctl start optimus-manager
