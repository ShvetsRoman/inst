#!/bin/bash

rofi_com_umount="$HOME/.config/rofi/bin/launcher_usb-umount.sh"

usbcheck(){ \
  mounteddrives="$(lsblk -rpo "name,type,size,mountpoint" | grep -v 'sda' | grep -v 'sdb' | awk '$2=="part"&&$4!=""{printf "  %s (%s)\t  ",$1,$3}')"
  if [ $(echo "$mounteddrives" | wc -w) -gt 0 ]; then
    # echo "$mounteddrives"
    echo "  "
  else
    echo ""
  fi
}

umountusb(){ \
  chosen=$(echo "$mounteddrives" | $rofi_com_umount | awk '{print $1}')
  mountpoint=$(udisksctl unmount --no-user-interaction -b "$chosen" 2>/dev/null) && notify-send "💻 USB unmounting" "$chosen mounted" && exit 0
  udisksctl power-off --no-user-interaction -b "$chosen"
}

umountall(){ \
  for chosen in $(echo $(lsblk -rpo "name,type,size,mountpoint" | grep -v 'sda' | awk '$2=="part"&&$4!=""{printf "%s\n",$1}')); do
    udisksctl unmount --no-user-interaction -b "$chosen"
    udisksctl power-off --no-user-interaction -b "$chosen"
  done
}

usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | grep -v 'sda' | grep -v 'sdb' | awk '$2=="part"&&$4==""{printf "%s (%s)\n",$1,$3}')"
mounteddrives="$(lsblk -rpo "name,type,size,mountpoint" | grep -v 'sda' | grep -v 'sdb' | awk '$2=="part"&&$4!=""{printf "%s (%s)\n",$1,$3}')"

case "$1" in
  --check)
    usbcheck
    ;;
  --umount)
    if [ $(echo "$mounteddrives" | wc -w) -gt 0 ]; then
      notify-send "USB drive(s) detected."
      umountusb
    else
      notify-send "No USB drive(s) to unmount." && exit
    fi
    ;;
  --umount-all)
    if [ $(echo "$mounteddrives" | wc -w) -gt 0 ]; then
      notify-send "Unmounting all USB drives."
      umountall
    else
      notify-send "No USB drive(s) to unmount." && exit
    fi
     ;;
esac
