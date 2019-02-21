#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source "$HOME/set-me-up/.dotfiles/utilities/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "  Ubuntu Preferences\n\n"
    
    # App preferences
    ./apps/terminal/terminal.sh

    # System preferences
    ./system/privacy.sh
    ./system/ui_and_ux.sh

}

main
