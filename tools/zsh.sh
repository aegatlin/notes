#!/bin/zsh

zsh__setup () {
  __message "Overriding ~/.zshrc"

  rm ~/.zshrc
  curl -fsSL "https://raw.githubusercontent.com/aegatlin/notes/master/_mac_zshrc" > ~/.zshrc
  source ~/.zshrc
}
