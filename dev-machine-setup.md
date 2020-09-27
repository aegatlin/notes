# dev machine setup

## Snaps

Snaps are the future of Linux. When possible, prioritize them over distro-dependent installation tooling.

```zsh
sudo snap install code --classic
sudo snap install heroku --classic
sudo snap install vlc
sudo snap install postman
```

## Apt

To maintain `apt` cleanliness:

```zsh
sudo apt upgrade
sudo apt autoremove
```

Two relatively important packages are missing (at the time of this writing) from the minimal install of Ubuntu. `usb-creator-gtk` is necessary to create bootup disk images. `fonts-noto-color-emoji` is necessary to view certain emojis.

- "echo 'text' >> file.ext" adds 'text' to the bottom of the content in file.ext.

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
