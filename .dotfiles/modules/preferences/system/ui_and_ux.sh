#!/bin/bash

# shellcheck source=/dev/null

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

gsettings set org.gnome.desktop.background picture-uri "file:///$WALLPAPER_DIRECTORY/kali-red-background.jpg"
gsettings set org.gnome.desktop.background picture-options 'stretched'

gsettings set org.gnome.desktop.screensaver picture-uri "file:///$WALLPAPER_DIRECTORY/kali-red-background.jpg"
gsettings set org.gnome.desktop.screensaver picture-options 'stretched'

gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.datetime automatic-timezone true
