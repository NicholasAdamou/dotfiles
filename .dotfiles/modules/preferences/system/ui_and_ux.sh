#!/bin/bash

# shellcheck source=/dev/null

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

gsettings set org.gnome.desktop.background picture-uri "file:///$WALLPAPER_DIRECTORY/nord.jpg"
gsettings set org.gnome.desktop.background picture-options 'stretched'

gsettings set org.gnome.desktop.screensaver picture-uri "file:///$WALLPAPER_DIRECTORY/nord.jpg"
gsettings set org.gnome.desktop.screensaver picture-options 'stretched'

gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.datetime automatic-timezone true

gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
gsettings set org.gnome.desktop.session idle-delay '0'

#see: https://askubuntu.com/a/1026532
dconf write /org/gnome/shell/favorite-apps "[
    'org.gnome.Nautilus.desktop',
    'firefox.desktop',
    'chromium-browser.desktop',
    'org.gnome.Software.desktop',
    'org.gnome.Terminal.desktop',
    'gnome-control-center.desktop'
]"

if command -v "hostnamectl" &>/dev/null; then
    hostnamectl set-hostname ubuntu
fi

