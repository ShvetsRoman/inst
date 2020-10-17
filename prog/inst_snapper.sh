#!/bin/bash

sudo pacman -Syu --noconfirm --needed snapper grub-btrfs

sudo umount /.snapshots
sudo rm -rfv /.snapshots/
sudo snapper -c root create-config /

sudo chmod a+rx /.snapshots
sudo chown :users /.snapshots

sudo sed -i 's/^ALLOW_USERS=.*/ALLOW_USERS="'$USER'"/g' /etc/snapper/configs/root
sudo sed -i 's/^TIMELINE_LIMIT_HOURLY=.*/HTIMELINE_LIMIT_HOURLY="0"/g' /etc/snapper/configs/root
sudo sed -i 's/^TIMELINE_LIMIT_DAILY=.*/HTIMELINE_LIMIT_DAILY="8"/g' /etc/snapper/configs/root
sudo sed -i 's/^TIMELINE_LIMIT_WEEKLY=.*/HTIMELINE_LIMIT_WEEKLY="10"/g' /etc/snapper/configs/root
sudo sed -i 's/^TIMELINE_LIMIT_MONTHLY=.*/HTIMELINE_LIMIT_MONTHLY="7"/g' /etc/snapper/configs/root
sudo sed -i 's/^TIMELINE_LIMIT_YEARLY=.*/HTIMELINE_LIMIT_YEARLY="0"/g' /etc/snapper/configs/root

sudo systemctl enable snapper-timeline.timer
sudo systemctl start snapper-timeline.timer
sudo systemctl enable snapper-cleanup.timer
sudo systemctl start snapper-cleanup.timer
sudo systemctl enable grub-btrfs.path
sudo systemctl start grub-btrfs.path
