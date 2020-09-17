#!/bin/zsh

URL="https://raw.githubusercontent.com/aegatlin/notes/master/"

# sole function ran at bottom of file.
setup () {
  _source_remote_functions
  __message "Setup initiated"

  _execute_setup
  _clean
  
  __message "Setup completed"
}

_source_remote_functions () {
  _source_remote_utility_functions

  _source_remote_tool "asdf.sh"
  _source_remote_tool "brew.sh"
  _source_remote_tool "direnv.sh"
  _source_remote_tool "git.sh"
  _source_remote_tool "zsh.sh"
}

_source_remote_tool () {
  temp="$(mktemp ./temp.sh.XXX)"
  chmod 744 "$temp"
  curl -fsSL "$URL/tools/$1" > "$temp"
  source "$temp"
}

_source_remote_utility_functions () {
  temp="$(mktemp ./temp.sh.XXX)"
  chmod 744 "$temp"
  curl -fsSL "$URL/utility_functions.sh" > "$temp"
  source "$temp"
}

# brew: install, setup, augment
# git: setup
# asdf: install, setup, augment
# zsh: augment, initiate
# direnv: augment 
_execute_setup () {
  brew__install
  asdf__install

  brew__setup
  git__setup
  asdf__setup

  zsh__augment
  brew__augment
  direnv__augment
  asdf__augment

  zsh__initiate
}

_clean () {
  rm temp.sh.*
}

setup