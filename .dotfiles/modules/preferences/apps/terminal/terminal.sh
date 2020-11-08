#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ./gnome-terminal-profile/gnome-terminal-profile import solarized
./nord-gnome-terminal/nord.sh --profile nord
