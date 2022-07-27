#!/bin/bash

rofi_com_mount="$HOME/.config/rofi/bin/launcher_usb-mount.sh"

usbcheck(){ \
  mounteddrives="$(lsblk -rpo "name,type,size,mountpoint" | grep -v 'sda' | grep -v 'sdb' | awk '$2=="part"&&$4!=""{printf "%s (%s)\t  ",$1,$3}')"
if [ $(echo "$usbdrives" | wc -w) -gt 0 ]; then
  echo " "
else
  echo ""
fi
}

mountusb(){ \
  # chosen=$(echo "$usbdrives" | rofi -dmenu -show run -lines 5 -opacity "85" -bw 0 -width 30 -padding 20 -i -p "Mount which drive?" | awk '{print $1}')
  chosen=$(echo "$usbdrives" | $rofi_com_mount | awk '{print $1}')
  mountpoint=$(udisksctl mount --no-user-interaction -b "$chosen" 2>/dev/null) && notify-send "💻 USB mounting" "$chosen mounted to $mountpoint" && exit 0

}

usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | grep -v 'sda' | grep -v 'sdb' | awk '$2=="part"&&$4==""{printf "%s (%s)\n",$1,$3}')"
mounteddrives="$(lsblk -rpo "name,type,size,mountpoint" | grep -v 'sda' | grep -v 'sdb' | awk '$2=="part"&&$4!=""{printf "%s (%s)\n",$1,$3}')"

case "$1" in
  --check)
    usbcheck
    ;;
  --mount)
    if [ $(echo "$usbdrives" | wc -w) -gt 0 ]; then
      notify-send "USB drive(s) detected."
      mountusb
    else
      notify-send "No USB drive(s) detected." && exit
    fi
    ;;
esac
