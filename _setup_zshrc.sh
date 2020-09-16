#!/bin/zsh

_setup_zshrc () {
  _message "Overriding ~/.zshrc"

  rm ~/.zshrc
  curl -fsSL "https://raw.githubusercontent.com/aegatlin/notes/master/_mac_zshrc" > ~/.zshrc
  source ~/.zshrc
}
