#!/bin/bash

# shellcheck source=/dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # App preferences
    ./apps/terminal/terminal.sh

    # System preferences
    ./system/privacy.sh
    ./system/ui_and_ux.sh

}

main
