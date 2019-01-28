# [Nicholas](https://github.com/nicholasadamou)’s Windows Sub-System Linux dotfiles

Personal Windows Sub-System Linux dotfiles, powered by [nicholasadamou/set-me-up](https://github.com/nicholasadamou/set-me-up/tree/debian) ✨

## Requirements

In order to install my `dotfiles` repository, you have to install my [`boxstarter`](http://boxstarter.org/) setup.

To install my [`boxstarter configurations`](https://gist.github.com/nicholasadamou/b1673f77db7c7795ad0f038431af1460), follow these steps:

1. Install [Boxstarter Modules](https://boxstarter.org/Learn/WebLauncher). You can download the Boxstarter module installer from [this web site](https://boxstarter.org/downloads/Boxstarter.2.11.0.zip) or you can use [Chocolatey to install Boxstarter](https://boxstarter.org/InstallBoxstarter). Alternatively, you may invoke the module installer over the web using PowerShell.

    a) If running `Powershell v3`:

    ```powershell
    . { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
    ```

    b) If running `Powershell v2`:

    ```powershell
    iex ((New-Object System.Net.WebClient).DownloadString('https://boxstarter.org/bootstrapper.ps1')); get-boxstarter -Force
    ```

2. Invoke the `Install-BoxstarterPackage` command pointing to my gist linked above:

    ```powershell
    Install-BoxstarterPackage -PackageName https://gist.github.com/nicholasadamou/b1673f77db7c7795ad0f038431af1460/raw/e13a95ada11bb086943cd9139eff976550368fbb/boxstarter.txt -DisableReboots
    ```

I use [`hyper`](https://hyper.is/) as my default terminal application. `hyper` must be configured to start `bash` as the start-up shell. To configure `hyper` to start with `bash` as the default shell, do the following:

1. open `.hyper.js` configuration file
2. Find the `shell` line and change it to `shell: 'C:\\Windows\\System32\\bash.exe',`.

If `Windows-Subsystem-Linux` is not installed on your system, follow the guide on the following link: [Windows Subsystem Linux Installation Guide](https://msdn.microsoft.com/en-us/commandline/wsl/install-win10#).

My [`hyper configurations`](https://gist.github.com/nicholasadamou/1c5a6c93fec9a9b6b6aa24bfc30a1e3a/raw/2a7f23903a7e2da1a1e6c7670df87af8fa26fc7e/hyper.js) can be found if you follow that link.

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
