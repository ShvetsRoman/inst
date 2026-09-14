!#/bin/bash


sudo pacman -S --noconfirm --needed virtualbox virtualbox-host-dkms linux-headers

sudo usermod -aG vboxusers $USER

sudo systemctl enable --now vboxservice

sudo reboot now
