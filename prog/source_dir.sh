#!/bin/bash

color() {
	case "$1" in
	red)
		echo -e "\n\033[31m$2\033[0m"
		;;
	yellow)
		echo -e "\n\033[33m$2\033[0m"
		;;
	green)
		echo -e "\n\033[32m$2\033[0m"
		;;
	esac
}

DIR_HOME_CONF="${HOME}"/.config

if [[ -d "${HOME}"/00_setup/sh/inst/prog ]]; then 
    DIR_TEMP_PROG="${HOME}"/00_setup/sh/inst/prog
elif [[ -d "${HOME}"/temp/inst/prog ]]; then
    DIR_TEMP_PROG="${HOME}"/temp/inst/prog
else
  color red "###########################"
  color red "Папка з програмами відсутня"
  color red "###########################"
  sleep 5s
fi

if [[ -d "${HOME}"/00_setup/sh/inst/prog/conf ]]; then 
    DIR_TEMP_CONF="${HOME}"/00_setup/sh/inst/prog/conf
elif [[ -d "${HOME}"/temp/inst/prog/conf ]]; then
    DIR_TEMP_CONF="${HOME}"/temp/inst/prog/conf
else
  color red "##############################"
  color red "Налаштування программ відсутні"
  color red "##############################"
  sleep 5s
fi
