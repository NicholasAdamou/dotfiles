
#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source "$HOME/set-me-up/.dotfiles/utilities/utils.sh"

declare WALLPAPER_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/wallpaper"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "   UI & UX\n\n"

execute "gsettings set org.gnome.desktop.background picture-uri 'file:///$WALLPAPER_DIRECTORY/kali-red-background.jpg'" \
    "Set desktop wallpaper"
