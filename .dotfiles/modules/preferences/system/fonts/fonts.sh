#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source "$HOME/set-me-up/.dotfiles/utilities/utils.sh"

declare -r FONTS_DIRECTORY="$HOME/set-me-up/.dotfiles/modules/preferences/system/fonts"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_fnts() {

	declare -a FNTS=(
        "Menlo-for-Powerline"
	)

	for fnt in "${FNTS[@]}";
		do
            declare -r fnt="$( echo "$fnt" | sed 's/[-._]/ /g' )"

			if cmd_exists "font-manager"; then
				if ! [[ "$(font-manager --list | grep "$fnt")" =~ $fnt ]];  then
					execute \
					    "font-manager --install $FONTS_DIRECTORY/$( echo "$fnt" | sed 's/ /\\\ /g' )/*" \
						"font-manager (install $fnt)"
				else
                    print_success "($fnt) is already installed."
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
                execute \
                    "$FONTS_DIRECTORY/nerd-fonts/install.sh -q -l $fnt" \
                    "Nerd-Fonts (install $fnt)"
            else
                print_success "($fnt) is already installed."
            fi
        done

}

main() {

    print_in_purple "   Fonts\n\n"

    apt_install_from_file "packages"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_fnts
    install_patched_fnts

}

main
