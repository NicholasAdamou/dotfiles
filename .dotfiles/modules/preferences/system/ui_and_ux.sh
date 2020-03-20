#!/bin/bash

# shellcheck source=/dev/null

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

gsettings set org.gnome.desktop.background picture-uri "file:///$WALLPAPER_DIRECTORY/beach.jpeg"
gsettings set org.gnome.desktop.background picture-options 'stretched'

gsettings set com.canonical.indicator.bluetooth visible false

gsettings set com.canonical.indicator.sound visible false

gsettings set com.canonical.indicator.power icon-policy 'charge' && \
         gsettings set com.canonical.indicator.power show-time false

gsettings set com.canonical.indicator.datetime custom-time-format '%l:%M %p' && \
         gsettings set com.canonical.indicator.datetime time-format 'custom'

gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us' ]\"

#see: https://askubuntu.com/a/1026532
dconf write /org/gnome/shell/favorite-apps "[
    'org.gnome.Nautilus.desktop',
    'firefox.desktop',
    'chromium-browser.desktop',
    'org.gnome.Software.desktop',
    'org.gnome.Terminal.desktop',
    'gnome-control-center.desktop'
]"

#see: https://askubuntu.com/a/313466/552275
gsettings set org.gnome.desktop.session idle-delay '0'

if command -v "hostnamectl" &>/dev/null; then
    hostnamectl set-hostname ubuntu
fi
