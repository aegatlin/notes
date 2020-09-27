# Aliases

See [git](https://github.com/aegatlin/notes/wiki/git) & [shell](https://github.com/aegatlin/notes/wiki/shell) notes for setup aliases.

# Mac

Macs are on `zsh` by default. 

* [homebrew](https://brew.sh/) is life
* [asdf](https://asdf-vm.com/) is also life

# Linux / Ubuntu

Since I last setup a dev machine on Ubuntu, I discovered `asdf`. It is the world's greatest language version manager (and maybe package manager writ large??). Try it on Linux!

## Snaps

Snaps are the future of Linux. When possible, prioritize them over distro-dependent installation tooling.

```
sudo snap install code --classic
sudo snap install heroku --classic
sudo snap install vlc
sudo snap install postman
```

## Apt
To maintain `apt` cleanliness:
```bash
sudo apt upgrade
sudo apt autoremove
```

Two relatively important packages are missing (at the time of this writing) from the minimal install of Ubuntu. `usb-creator-gtk` is necessary to create bootup disk images. `fonts-noto-color-emoji` is necessary to view certain emojis.

* "echo 'text' >> file.ext" adds 'text' to the bottom of the content in file.ext.


```bash
sudo apt install curl
sudo apt install vim
sudo apt install net-tools
sudo apt install nmap
sudo apt install usb-creator-gtk
sudo apt install fonts-noto-color-emoju
sudo apt install postgresql
sudo apt install direnv
```

### Installing `postgresql`
You will need to create a default database:
```bash
> sudo -u postgres createuser --createdb $(whoami)
```

### Installing [direnv](https://direnv.net/)

You need to setup the appropriate [hook](https://direnv.net/docs/hook.html).

#### Understanding the hook
An example hook for bash is:
```bash
> echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

* `direnv hook bash` generates some special direnv bash functions
* `"$(direnv hook bash)"` string interpolates said functions
* `eval "$(direnv hook bash)"` evaluates the string of said functions as if you had just manually typed the function in to the terminal.
* `echo 'eval "$(direnv hook bash)"' >> ~/.bashrc` writes the string `eval "$(direnv hook bash)"` in to your `~/.bashrc` file so that `eval "$(direnv hook bash)"` will be evaluated every time you open a new terminal.
