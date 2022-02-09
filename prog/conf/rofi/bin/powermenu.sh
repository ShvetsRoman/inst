#!/usr/bin/env bash

rofi_command="rofi -theme $HOME/.config/rofi/themes_applets/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$($HOME/.config/rofi/bin/usedcpu)
memory=$($HOME/.config/rofi/bin/usedram)

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
			systemctl poweroff
        ;;
    $reboot)
			systemctl reboot
        ;;
    $lock)
			betterlockscreen -l blur
        ;;
    $suspend)
			mpc -q pause
			amixer set Master mute
			systemctl suspend
        ;;
    $logout)
				i3-msg exit
        ;;
esac
