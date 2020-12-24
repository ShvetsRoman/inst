#!/bin/bash

# Установка AVAHI
sudo pacman -S --noconfirm --needed avahi zeroconf-ioslave nss-mdns

sudo sed -i 's/^hosts:.*/hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4 mdns/g' /etc/nsswitch.conf
sudo sed -i 's/^#enable-dbus=yes/enable-dbus=yes/g' /etc/avahi/avahi-daemon.conf
sudo sed -i 's/^noipv4ll/#noipv4ll/g' /etc/dhcpcd.conf

# Открытие портов
sudo iptables -A INPUT -p tcp -m tcp --dport 139 -s 192.168.88.0/24 -j ACCEPT
sudo iptables-save -f /etc/iptables/iptables.rules

# Файл конфигурации
sudo mkdir -p /etc/avahi/services
cd /etc/avahi/services
sudo curl -LO https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/avahi.smb.service
sudo curl -LO https://raw.githubusercontent.com/ShvetsRoman/inst/main/prog/conf/ftp.service

sudo systemctl enable avahi-daemon.service
sudo systemctl enable avahi-dnsconfd.service
sudo systemctl start avahi-daemon.service
sudo systemctl start avahi-dnsconfd.service
sudo systemctl disable systemd-resolved.service
