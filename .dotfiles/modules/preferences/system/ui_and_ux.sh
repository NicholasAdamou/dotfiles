#!/bin/bash

# shellcheck source=/dev/null

source "$HOME/set-me-up/.dotfiles/utilities/utilities.sh"

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

action "Change Desktop Wallpaper to $WALLPAPER_DIRECTORY/kali-red-background.jpg"

xfconf-query -c xfce4-desktop \
    -p /backdrop/screen0/monitorVirtual1/workspace0/last-image \
    -s "$WALLPAPER_DIRECTORY/kali-red-background.jpg"


action "Change hostname to 'm3m0ry'"
sudo hostnamectl set-hostname "m3m0ry"
