#!/bin/bash
#set -e

if [[ -f "${HOME}"/01_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/01_project/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
fi

# Установка AVAHI
sudo pacman -S --noconfirm --needed avahi nss-mdns dbus-python python-gobject

sudo sed -i 's/^hosts:.*/hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns/g' /etc/nsswitch.conf
sudo sed -i 's/^#enable-dbus=yes/enable-dbus=yes/g' /etc/avahi/avahi-daemon.conf
sudo sed -i 's/^noipv4ll/#noipv4ll/g' /etc/dhcpcd.conf

# Открытие портов
sudo iptables -A INPUT -p tcp -m tcp --dport 139 -s 192.168.88.0/24 -j ACCEPT
sudo iptables-save -f /etc/iptables/iptables.rules

# Файл конфигурации
sudo cp -rfv "${DIR_TEMP_CONF}"/avahi /etc/

sudo systemctl stop systemd-resolved.service
sudo systemctl disable systemd-resolved.service
 
sudo systemctl enable avahi-daemon.service avahi-daemon.socket avahi-dnsconfd.service
sudo systemctl start avahi-daemon.service avahi-daemon.socket avahi-dnsconfd.service
