#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source "$HOME/set-me-up/.dotfiles/utilities/utilities.sh"

readonly SMU_PATH="$HOME/set-me-up"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_bash_local() {

    declare -r FILE_PATH="$HOME/.bash.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [[ ! -e "$FILE_PATH" ]] || [[ -z "$FILE_PATH" ]]; then
        printf "%s\n" "#!/bin/bash" >> "$FILE_PATH"
	fi

}

install_fisher() {

    if ! is_fisher_installed; then
        curl -Lo "$HOME"/.config/fish/functions/fisher.fish --create-dirs --silent https://git.io/fisher
    fi

}

install_fisher_packages() {

	cat < "$HOME/.config/fish/fishfile" | while read -r PACKAGE; do
		fisher_install "$PACKAGE"
	done

    fisher_update

}

symlink() {

	# Get the absolute path of the .dotfiles directory.
    # This is only for aesthetic reasons to have an absolute symlink path instead of a relative one
    # <path-to-smu>/.dotfiles/somedotfile vs <path-to-smu>/.dotfiles/base/../somedotfile
    readonly dotfiles="${SMU_PATH}/.dotfiles"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Update and/or install dotfiles. These dotfiles are stored in the .dotfiles directory.
    # rcup is used to install files from the tag-specific dotfiles directory.
    # rcup is part of rcm, a management suite for dotfiles.
    # Check https://github.com/thoughtbot/rcm for more info.

    export RCRC="$dotfiles/rcrc" && \
            rcup -v -f -d "${dotfiles}"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

	apt_install_from_file "packages"

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    	# Install thoughtbot/RCM for dotfile management.
    	# see: https://github.com/thoughtbot/rcm#installation

    	! package_is_installed "rcm" && {
        	wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
		echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
		sudo apt update
		sudo apt install -y "rcm"
    	}

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	# We must first create the $HOME/.bash.local configuration file
	# in order for the brew module to properly install Homebrew.
	create_bash_local

	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   	# We must now symlink our dotfiles prior to executing any other function.
    	# This is required because any further action will require our dotfiles
    	# to be present in our $HOME directory.
    	symlink

}

main
