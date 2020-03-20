# [Nicholas](https://github.com/nicholasadamou)’s Ubuntu dotfiles

Personal Ubuntu dotfiles, powered by [nicholasadamou/set-me-up](https://github.com/nicholasadamou/set-me-up/tree/debian) ✨

## Setup

[![xkcd: Automation](http://imgs.xkcd.com/comics/automation.png)](http://xkcd.com/1319/)

To install my `dotfiles`, just run the snippet in `terminal`:

(⚠️ **DO NOT** run the `install` snippet if you don't fully
understand [what it does](.dotfiles/modules/install.sh). Seriously, **DON'T**!)

```bash
bash <(curl -s -L https://raw.githubusercontent.com/nicholasadamou/dotfiles/ubuntu/.dotfiles/modules/install.sh)
```

⚠️ Please note in order to successfully install my `dotfiles`, you must install `curl` and `git` prior to executing the above snippet.


```bash
sudo apt install curl git -y
```

⚠️ Please note that more about the installation process can be found at [nicholasadamou/set-me-up](https://github.com/nicholasadamou/set-me-up/tree/debian).

That's it! ✨

## Snippets

To quickly install **all** modules provided with my `dotfiles`, simply run the snippet in `terminal` after running the above:

```bash
cd $HOME && \
    ./set-me-up/smu -p \
        -m formulae \
        -m editor \
        -m nordvpn \
        -m web \
        -m preferences
 ```
 
 Happy hacking! 🚀

## What's inside

1.  A `rcm` tag called [ubuntu](.dotfiles/tag-ubuntu) and an adapted `rcrc` file.
2.  [A variety of modules](https://github.com/nicholasadamou/set-me-up/tree/debian/.dotfiles/modules). Read more about the available modules in the [available modules](https://github.com/nicholasadamou/set-me-up/tree/debian#available-modules) section.
3.  [Installer](.dotfiles/modules/install.sh) that is required to download `set-me-up` on top of my blueprint.

## Credits

-   [omares/set-me-up](https://github.com/omares/set-me-up/tree/debian) for the initial platform that [nicholasadamou/set-me-up](https://github.com/nicholasadamou/set-me-up/tree/debian) was built on.
-   [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup)
-   [mathiasbynens](https://github.com/mathiasbynens/dotfiles) for his popular [macOS script](https://github.com/mathiasbynens/dotfiles/blob/master/.macos).
-   [argbash.io](https://argbash.io/) enabling library free and sane argument parsing.
-   [brew](https://brew.sh/) and [brew bundle](https://github.com/Homebrew/homebrew-bundle) for the awesome package management.
-   [thoughtbot rcm](https://github.com/thoughtbot/rcm) for easy dotfile management.
-   All of the authors of the installed applications via `set-me-up` , I am in no way connected to any of them.

Should I miss your name on the credits list please let me know :heart:

## Liability

The creator of this repo is _not responsible_ if your machine ends up in a state you are not happy with.

## License

The code is available under the [MIT license](LICENSE.txt).
