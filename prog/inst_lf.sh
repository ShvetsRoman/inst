#!/bin/bash
#set -e
 
if [[ -f "${HOME}"/00_project/sh/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/00_project/sh/inst/prog/source_dir.sh
elif [[ -f "${HOME}"/temp/inst/prog/source_dir.sh ]]; then
  source "${HOME}"/temp/inst/prog/source_dir.sh
fi
 
function color() {
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

##### lf #####
color green "[*] Installing lf..."
pikaur -S --noconfirm --needed lf
# Copy config LF (terminal-file-manager) 
if [[ -d "${DIR_HOME_CONF}"/lf ]]; then
  rm -rf "${DIR_HOME_CONF}"/lf
fi
cp -rv "${DIR_TEMP_CONF}"/lf "${DIR_HOME_CONF}"/ 
if [[ -d "${DIR_HOME_CONF}"/lf-ueberzug ]]; then
  rm -rf "${DIR_HOME_CONF}"/lf-ueberzug
fi
cp -rv "${DIR_TEMP_CONF}"/lf-ueberzug "${DIR_HOME_CONF}"/ 
