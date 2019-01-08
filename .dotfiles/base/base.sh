#!/bin/bash

# shellcheck source=/dev/null

declare current_dir && \
    current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    cd "${current_dir}" && \
    source <(curl -s "https://raw.githubusercontent.com/nicholasadamou/utilities/linux/utils.sh")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_bash_local() {

    declare -r FILE_PATH="$HOME/.bash.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then
        printf "%s\n" "#!/bin/bash" >> "$FILE_PATH"

        print_result $? "$FILE_PATH"
    else
        print_success "($FILE_PATH) already exists."
    fi

}

create_gitconfig_local() {

    declare -r FILE_PATH="$HOME/.gitconfig.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        if [ "$(git -C "$SMU_PATH" config --global --get user.name)" = "" ] && [ "$(git -C "$SMU_PATH" config --global --get user.email)" = "" ]; then
            print_in_yellow "\n   Git Configuration\n\n"

            ask "What is your name? [e.g. John Smith]: "; NAME="$(get_answer)"
            ask "What is your email address? [e.g. johnsmith@gmail.com]: "; EMAIL="$(get_answer)"

            printf "\n"
        fi

        printf "%s\n" \
"[commit]
    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/
    # gpgsign = true
[user]
    name = $NAME
    email = $EMAIL
    # signingkey =" \
        >> "$FILE_PATH"

        print_result $? "$FILE_PATH"
    else
        print_success "($FILE_PATH) already exists."
    fi

}

create_vimrc_local() {

    declare -r FILE_PATH="$HOME/.vimrc.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then
        touch "$FILE_PATH"

        print_result $? "$FILE_PATH"
    else
        print_success "($FILE_PATH) already exists."
    fi

}

symlink() {

    SYMLINK_DIR="$(cd tag-kali && pwd)"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local target=""
	local fileName=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # symlink files starting with `.*` to $HOME
    while IFS= read -r -d '' file
    do
        fileName=$(basename "$file")

        file_to_symlink="$SYMLINK_DIR/$fileName"

        target="$HOME/$fileName"

        symlink "$file_to_symlink" "$target"
    done < <(find "$SYMLINK_DIR" -maxdepth 1 -name ".*")

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "  Base\n"

    print_in_yellow "\n   Create local config files\n\n"

    create_bash_local
    create_gitconfig_local
    create_vimrc_local

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_yellow "\n   Symlink dotfiles\n\n"

    symlink

}

main
