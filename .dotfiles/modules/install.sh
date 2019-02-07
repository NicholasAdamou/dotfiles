#!/bin/bash

# GitHub user/repo & branch value of your set-me-up blueprint (e.g.: nicholasadamou/set-me-up-blueprint/master).
# Set this value when the installer should additionally obtain your blueprint.
export SMU_BLUEPRINT=${SMU_BLUEPRINT:-"nicholasadamou/dotfiles"}
export SMU_BLUEPRINT_BRANCH=${SMU_BLUEPRINT_BRANCH:-"ubuntu"}

# The set-me-up version to download
# Available versions:
# 1. 'master' (MacOS)
# 2. 'debian'
export SMU_VERSION=${SMU_VERSION:-"debian"}

# A set of ignored paths that 'git' will ignore
# syntax: '<path>|<path>'
export SMU_IGNORED_PATHS="${SMU_IGNORED_PATHS:-""}"

bash <(curl -s -L https://raw.githubusercontent.com/nicholasadamou/set-me-up/"${SMU_VERSION}"/.dotfiles/modules/install.sh)
