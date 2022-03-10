#!/bin/bash
#set -e

# Установка SAMBA
sudo pacman -S --noconfirm --needed samba smbclient gvfs-smb smb4k

# Открытие портов
sudo iptables -A INPUT -p udp -m udp --dport 137 -s 192.168.88.0/24 -j ACCEPT
sudo iptables -A INPUT -p udp -m udp --dport 138 -s 192.168.88.0/24 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 139 -s 192.168.88.0/24 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 445 -s 192.168.88.0/24 -j ACCEPT
sudo iptables-save -f /etc/iptables/iptables.rules

# Пользовательские ресурсы
sudo smbpasswd -a -s ${USER}
sudo groupadd -r sambashare
sudo gpasswd sambashare -a ${USER}

sudo mkdir -p /var/lib/samba/usershares
sudo chown root:sambashare /var/lib/samba/usershares
sudo chmod 1770 /var/lib/samba/usershares

# Файл конфигурации
sudo cp -rfv ${HOME}/temp/inst/prog/conf/smb /etc/ 

sudo systemctl enable smb.service
sudo systemctl enable nmb.service
sudo systemctl start smb.service
sudo systemctl start nmb.service
