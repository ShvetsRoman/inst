#!/usr/bin/env bash

#theme="kde_simplemenu"
theme="style_7"
dir="$HOME/.config/rofi/themes_launcher"

rofi -no-lazy-grab -modi drun,run,ssh,combi -show drun -show-icons -icon-theme Papirus -theme $dir/"$theme"
