#!/bin/bash

# KDE Arch
sed -i 's/^DisplayCommand/#DisplayCommand/g' /etc/sddm.conf
sed -i 's/^DisplayStopCommand/#DisplayStopCommand/g' /etc/sddm.conf
sed -i 's/^MODULES=.*/MODULES=(i915)/g' /etc/mkinitcpio.conf

sudo pacman -S --noconfirm --needed xf86-video-intel nvidia nvidia-utils nvidia-settings lib32-nvidia-utils bbswitch

pikaur -S --noconfirm --noedit optimus-manager
pikaur -S --noconfirm --noedit optimus-manager-qt

sudo mkinitcpio -P

sudo systemctl enable optimus-manager
sudo systemctl start optimus-manager
