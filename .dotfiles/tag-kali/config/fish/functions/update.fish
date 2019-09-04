function update --description "Updates MacOS apps, brew, npm, fisher, omf update, pip, pip3 and their installed packages"
    if type -q nordvpn
    	nordvpn connect
    end
    
    sudo killall apt apt-get -q
    sudo dpkg --configure -a
    
    sudo apt update
    sudo apt upgrade -y
    sudo apt dist-upgrade -y
    sudo apt full-upgrade -y
    sudo apt autoremove -y --purge
    sudo apt clean
    sudo apt autoclean

    if type -q brew
        brew update
        brew upgrade
        brew cleanup
    end

    if type -q fisher
        fisher
        fisher self-update
    end

	if type -q omf
		omf update
	end

    fish_update_completions

    if type -q npm
        sudo npm install npm@latest -g

        if type -q npm-check
            sudo npm-check --global --update-all
        end
    end

    if type -q pip
        pip install --quiet --user --upgrade pip
        pip install --quiet --user --upgrade setuptools

        if type -q pip-review
            pip-review -a
        end
    end

    if test -f $HOME/.vim/plugins/Vundle.vim
        vim +PluginUpdate +qall
    end
end