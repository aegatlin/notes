#!/bin/bash

_setup_brew () {
  if _not_has_program brew; then
    _message "Installing brew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  _run_command "brew update" "Note: this could take a few minutes."
  _ensure_brew_install coreutils
  _ensure_brew_install curl
  _ensure_brew_install git
  _ensure_brew_install direnv
  _ensure_brew_install mosh
  _ensure_brew_install gpg
}

_ensure_brew_install () {
  if ! brew list | grep -q "$1"; then
    _run_command "brew install $1"
  fi
}
