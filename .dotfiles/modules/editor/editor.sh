#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source "$HOME/set-me-up/.dotfiles/utilities/utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

configure_visual_studio_code() {

    local extension="Shan.code-settings-sync"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! cmd_exists "code"; then
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! [ "$(code --user-data-dir /root --list-extensions | grep $extension)" == "$extension" ]; then
        execute \
            "code --user-data-dir /root --install-extension $extension" \
            "code ($extension)"
    else
        print_success "($extension) is already installed"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "  Editor\n\n"

	apt_install_from_file "packages"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	print_in_yellow "\n   Configure Visual Studio Code\n\n"

    configure_visual_studio_code

}

main
