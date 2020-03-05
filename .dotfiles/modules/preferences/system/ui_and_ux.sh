#!/bin/bash

# shellcheck source=/dev/null

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

gsettings set org.gnome.desktop.background picture-uri "file:///$WALLPAPER_DIRECTORY/curcuit-board.jpg"
gsettings set org.gnome.desktop.background picture-options 'stretched'

gsettings set com.canonical.indicator.bluetooth visible false

gsettings set com.canonical.indicator.sound visible false

gsettings set com.canonical.indicator.power icon-policy 'charge' && \
         gsettings set com.canonical.indicator.power show-time false

gsettings set com.canonical.indicator.datetime custom-time-format '%l:%M %p' && \
         gsettings set com.canonical.indicator.datetime time-format 'custom'

gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us' ]\"

#see: https://askubuntu.com/a/883999/552275
gsettings set com.canonical.Unity.Launcher favorites \"[
            'application://org.gnome.Nautilus.desktop',
            'application://chromium-browser.desktop',
            'application://firefox.desktop',
            'application://org.gnome.Software.desktop',
            'application://hyper.desktop',
            'application://terminator.desktop',
            'application://unity-control-center.desktop'
         ]\"

#see: https://askubuntu.com/q/660855/552275
gsettings set org.gnome.desktop.interface gtk-theme 'Numix' && \
    gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'

#see: https://askubuntu.com/a/313466/552275
gsettings set org.gnome.desktop.session idle-delay '0'

if cmd_exists "hostnamectl"; then
    hostnamectl set-hostname ubuntu
fi
