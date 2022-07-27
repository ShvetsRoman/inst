#!/usr/bin/env bash

#theme="kde_simplemenu"
# theme="style_7"
theme="style_7_usb-umount"
dir="$HOME/.config/rofi/themes_launcher"

# rofi -no-lazy-grab -modi drun,run,ssh,combi -show drun -show-icons -icon-theme Papirus -theme $dir/"$theme"
rofi -no-lazy-grab -dmenu -show run -lines 5 -show-icons -icon-theme Papirus -theme $dir/"$theme"
