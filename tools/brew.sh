#!/bin/zsh

brew__setup () {
  if ! __has_command brew; then
    __message "Installing brew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  __run_command "brew update" "Note: this could take a few minutes."
  _brew__ensure_brew_install coreutils
  _brew__ensure_brew_install curl
  _brew__ensure_brew_install git
  _brew__ensure_brew_install direnv
  _brew__ensure_brew_install mosh
  _brew__ensure_brew_install gpg
}

_brew__ensure_brew_install () {
  if ! brew list | grep -q "$1"; then
   __run_command "brew install $1"
  fi
}
