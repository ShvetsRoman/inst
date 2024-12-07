#!/bin/bash
#set -e

if [[ -f "${HOME}"/00_setup/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/00_setup/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
fi

# Установка SAMBA
sudo pacman -S --noconfirm --needed samba smbclient gvfs-smb kdenetwork-filesharing
pikaur -S --noconfirm --noedit wsdd2

# Открытие портов
sudo iptables -A INPUT -p udp -m udp --dport 137 -s 192.168.88.0/24 -j ACCEPT
sudo iptables -A INPUT -p udp -m udp --dport 138 -s 192.168.88.0/24 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 139 -s 192.168.88.0/24 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 445 -s 192.168.88.0/24 -j ACCEPT
sudo iptables-save -f /etc/iptables/iptables.rules

# Пользовательские ресурсы
sudo smbpasswd -a -s "${USER}"
sudo groupadd -r sambashare
sudo gpasswd sambashare -a "${USER}"
# Создание общего ресурса для анонимных пользователей
sudo useradd guest -s /bin/nologin

sudo mkdir -p /var/lib/samba/usershares
sudo chown root:sambashare /var/lib/samba/usershares
sudo chmod 1770 /var/lib/samba/usershares

# Файл конфигурации
sudo cp -rfv "${DIR_TEMP_CONF}"/smb/smb.conf /etc/samba/ 

sudo sed -i 's/^hosts:.*/hosts: mymachines resolve [!UNAVAIL=return] files myhostname dns wins/g' /etc/nsswitch.conf

sudo systemctl enable smb.service
sudo systemctl enable nmb.service
sudo systemctl enable winbind.service
sudo systemctl enable wsdd2.service
sudo systemctl start smb.service
sudo systemctl start nmb.service
sudo systemctl start winbind.service
sudo systemctl start wsdd2.service
