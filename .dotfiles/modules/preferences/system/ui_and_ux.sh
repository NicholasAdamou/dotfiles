#!/bin/bash

# shellcheck source=/dev/null

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

xfconf-query -c xfce4-desktop \
    -p /backdrop/screen0/monitorVirtual1/workspace0/last-image \
    -s "$WALLPAPER_DIRECTORY/kali-red-background.jpg"


sudo hostnamectl set-hostname "m3m0ry"
