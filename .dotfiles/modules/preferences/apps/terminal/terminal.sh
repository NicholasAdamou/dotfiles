#!/bin/bash

# shellcheck source=/dev/null

declare PROFILE="$(dconf list /org/gnome/terminal/legacy/profiles:/ | sed 's./..')"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

dconf write /org/gnome/terminal/legacy/profiles:/"$PROFILE"/visible-name 'solarized'
dconf write /org/gnome/terminal/legacy/profiles://"$PROFILE"/palette "['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']"
dconf write /org/gnome/terminal/legacy/profiles:/"$PROFILE"/font 'Fira Code 12'
