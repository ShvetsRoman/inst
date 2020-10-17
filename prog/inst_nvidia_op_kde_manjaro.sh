#!/bin/bash

# KDE Manjaro
sudo sed -i 's/^DisplayCommand/#DisplayCommand/g' /etc/sddm.conf
sudo sed -i 's/^DisplayStopCommand/#DisplayStopCommand/g' /etc/sddm.conf
sudo sed -i 's/^MODULES=.*/MODULES=(i915)/g' /etc/mkinitcpio.conf

sudo pacman -Syu --noconfirm --needed xf86-video-intel nvidia nvidia-utils lib32-nvidia-utils bbswitch optimus-manager

pikaur -Syu --noconfirm --noedit optimus-manager-qt

sudo mkinitcpio -P

sudo systemctl enable optimus-manager
sudo systemctl start optimus-manager
