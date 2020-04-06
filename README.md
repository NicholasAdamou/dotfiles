# [Nicholas](https://github.com/nicholasadamou)’s Windows Sub-System Linux dotfiles

Personal Windows Sub-System Linux dotfiles, powered by [nicholasadamou/set-me-up](https://github.com/nicholasadamou/set-me-up/tree/debian) ✨

## Requirements

In order to install my `dotfiles` repository, you have to install `Windows-Subsystem-Linux`.

If `Windows-Subsystem-Linux` is not installed on your system, follow the [Windows Subsystem Linux Installation Guide](https://msdn.microsoft.com/en-us/commandline/wsl/install-win10#) to install and set-up `Windows-Subsystem-Linux`.

## Setup

[![xkcd: Automation](http://imgs.xkcd.com/comics/automation.png)](http://xkcd.com/1319/)

To install my `dotfiles`, just run the snippet in `bash.exe`:

(⚠️ **DO NOT** run the `install` snippet if you don't fully
understand [what it does](.dotfiles/modules/install.sh). Seriously, **DON'T**!)

```bash
bash <(curl -s -L https://raw.githubusercontent.com/nicholasadamou/dotfiles/windows/.dotfiles/modules/install.sh)
```

⚠️ Please note that more about the installation process can be found at [nicholasadamou/set-me-up](https://github.com/nicholasadamou/set-me-up/tree/debian).

That's it! ✨

## Snippets

To quickly install **all** modules provided with my `dotfiles`, simply run the snippet in `bash.exe` after running the above:

```bash
cd $HOME && \
    ./set-me-up/smu -p \
      -m formulae \
      -m web
 ```
 
 Happy hacking! 🚀

## Removal

To completely remove my `dotfiles` from your system, simply
run the following snippet in the `cmd.exe` terminal:

`lxrun /uninstall /full # Uninstalls the current installation of WSL`

## What's inside

1.  A `rcm` tag called [windows](.dotfiles/tag-windows) and an adapted `rcrc` file.
2.  [A variety of modules](https://github.com/nicholasadamou/set-me-up/tree/debian/.dotfiles/modules). Read more about the available modules in the [available modules](https://github.com/nicholasadamou/set-me-up/tree/debian#available-modules) section.
3.  [Installer](.dotfiles/modules/install.sh) that is required to download `set-me-up` on top of my blueprint.

## Credits

-   [omares/set-me-up](https://github.com/omares/set-me-up) for the initial platform that [nicholasadamou/set-me-up](https://github.com/nicholasadamou/set-me-up/tree/debian) was built on.
-   [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup)
-   [argbash.io](https://argbash.io/) enabling library free and sane argument parsing.
-   [brew](https://brew.sh/) and [brew bundle](https://github.com/Homebrew/homebrew-bundle) for the awesome package management.
-   [thoughtbot rcm](https://github.com/thoughtbot/rcm) for easy dotfile management.
-   All of the authors of the installed applications via `set-me-up` , I am in no way connected to any of them.

Should I miss your name on the credits list please let me know :heart:

## Liability

The creator of this repo is _not responsible_ if your machine ends up in a state you are not happy with.

## License

The code is available under the [MIT license](LICENSE.txt).
