#!/bin/bash

# UPDATE Pacman + Pikaur
check_updates() {
  if ! updates_arch=$(checkupdates 2> /dev/null | wc -l); then
      updates_arch=0
  fi
  if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
      updates_aur=0
  fi

  updates=$((${updates_arch} + ${updates_aur}))
  if [ "${updates}" -gt 0 ]; then
     echo " ${updates}"
  else
     echo ""
  fi

  # UPDATE Pacman & Pikaur
  # if [[ "$updates_arch" -gt 0 && "$updates_aur" -gt 0 ]]; then
  #     echo " $updates_arch" " $updates_aur"
  # fi
  #
  # if [[ "$updates_arch" -gt 0 && "$updates_aur" == 0 ]]; then
  #     echo " $updates_arch"
  # fi
  #
  # if [[ "$updates_arch" == 0 && "$updates_aur" -gt 0 ]]; then
  #     echo " $updates_aur"
  # fi
  #
  # if [[ "$updates_arch" == 0 && "$updates_aur" == 0 ]]; then
  #     echo ""
  # fi
}

# UPDATE
updates() {
  alacritty -e sudo pikaur -Syyuu
}

if [[ $# -eq 0  ]]; then
  check_updates
fi
if [[ $1 == "-u" ]]; then
  updates
fi
