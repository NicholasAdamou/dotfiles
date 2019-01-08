#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source <(curl -s "https://raw.githubusercontent.com/nicholasadamou/utilities/linux/utils.sh")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "  Essentials\n\n"

    apt_install_from_file "packages"

}

main
