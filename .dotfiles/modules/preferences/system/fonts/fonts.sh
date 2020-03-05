#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source "$HOME/set-me-up/.dotfiles/utilities/utils.sh"

declare -r FONTS_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/fonts"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

download_fonts() {

    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts

}

update_fonts() {

    execute \
        "cd $FONTS_DIRECTORY && \
        git pull" \
        "nerd-fonts (update)"

}

install_fnts() {

	declare -a FNTS=(
        "Menlo-for-Powerline"
	)

	for fnt in "${FNTS[@]}";
		do
            declare -r fnt="$( echo "$fnt" | sed 's/[-._]/ /g' )"

			if cmd_exists "font-manager"; then
				if ! [[ "$(font-manager --list | grep "$fnt")" =~ $fnt ]];  then
					font-manager --install "$FONTS_DIRECTORY"/$( echo "$fnt" | sed 's/ /\\\ /g' )/*
				fi
			fi
		done

}

# Iconic font aggregator, collection, and patcher:
# 39 patched fonts (87k+ variations). Includes popular
# glyph collections such as Font Awesome & fonts such as Hack
#see: https://github.com/ryanoasis/nerd-fonts#font-installation
install_patched_fnts() {

    declare -a FNTS=(
        "Hack"
    )

    for fnt in "${FNTS[@]}";
        do
            if ! [[ "$(font-manager --list | grep "$fnt")" =~ $fnt ]];  then
                ${FONTS_DIRECTORY}/nerd-fonts/install.sh -q -l "$fnt"
            fi
        done

}

main() {

    apt_install_from_file "packages"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! [[ -d "$FONTS_DIRECTORY" ]]; then
        download_fonts
    else
        update_fonts
    fi

    install_fnts
    install_patched_fnts

}

main
