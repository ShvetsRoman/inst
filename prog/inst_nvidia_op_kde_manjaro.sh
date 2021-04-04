#!/bin/bash

# KDE Manjaro
# Настройка SDDM & MODULES для корректной работы Optimus-manager
sudo sed -i 's/^DisplayCommand/#DisplayCommand/g' /etc/sddm.conf
sudo sed -i 's/^DisplayStopCommand/#DisplayStopCommand/g' /etc/sddm.conf
sudo sed -i 's/^MODULES=.*/MODULES=(i915)/g' /etc/mkinitcpio.conf

# Установка драйвера intell & Nvidia & Optimus-manager
sudo pacman -Syu --noconfirm --needed xf86-video-intel nvidia nvidia-utils lib32-nvidia-utils bbswitch optimus-manager

# Автоматическая настройка
sudo nvidia-xconfig

# Устанока утилиты для настройки графики и для переключения
pikaur -Syu --noconfirm --noedit optimus-manager-qt

# Обновление RAM запись
sudo mkinitcpio -P

# Добавляем сервис в автозагрузку
sudo systemctl enable optimus-manager
sudo systemctl start optimus-manager
