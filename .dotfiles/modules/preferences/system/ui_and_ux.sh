#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source "$HOME/set-me-up/.dotfiles/utilities/utils.sh"

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "   UI & UX\n\n"

execute "gsettings set org.gnome.desktop.background picture-uri 'file:///$WALLPAPER_DIRECTORY/curcuit-board.jpg'" \
    "Set desktop wallpaper"

execute "gsettings set com.canonical.indicator.bluetooth visible false" \
    "Hide bluetooth icon from the menu bar"

execute "gsettings set com.canonical.indicator.sound visible false" \
    "Hide volume icon from the menu bar"

execute "gsettings set com.canonical.indicator.power icon-policy 'charge' && \
         gsettings set com.canonical.indicator.power show-time false" \
    "Hide battery icon from the menu bar when the battery is not in use"

execute "gsettings set com.canonical.indicator.datetime custom-time-format '%l:%M %p' && \
         gsettings set com.canonical.indicator.datetime time-format 'custom'" \
    "Use custom date format in the menu bar"

execute "gsettings set org.gnome.desktop.background picture-options 'stretched'" \
    "Set desktop background image options"

execute "gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us' ]\"" \
    "Set keyboard languages"

#see: https://askubuntu.com/a/883999/552275
execute "gsettings set com.canonical.Unity.Launcher favorites \"[
            'application://org.gnome.Nautilus.desktop',
            'application://chromium-browser.desktop',
            'application://firefox.desktop',
            'application://org.gnome.Software.desktop',
            'application://hyper.desktop',
            'application://terminator.desktop',
            'application://unity-control-center.desktop'
         ]\"" \
    "Set Launcher favorites"

#see: https://askubuntu.com/q/660855/552275
execute "gsettings set org.gnome.desktop.interface gtk-theme 'Numix' && gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'" \
    "Set theme to 'Numix'"

#see: https://askubuntu.com/a/313466/552275
execute "gsettings set org.gnome.desktop.session idle-delay '0'" \
    "Set 'turn screen off when inactive for' to 'never'"

if cmd_exists "hostnamectl"; then
    execute "hostnamectl set-hostname ubuntu" \
        "Set computer name to 'ubuntu'"
fi
