#!/bin/zsh

setup () {
  _source_remote_files
  _message "Setup initiated"
  
  _ensure_zsh
  _setup_apt
  # _setup_git # depends on brew to ensure `git`
  # _setup_asdf # depends on brew for coreutils curl and (maybe) `git`
  # _setup_zshrc # depends on brew and asdf

  _clean_up  
  _message "Setup completed"
}

_source_remote_files () {
  _use_file _utils.sh
  _use_file _setup_brew.sh
  _use_file _setup_git.sh
  _use_file _setup_asdf.sh
  _use_file _setup_zshrc.sh
}

_use_file () {
  temp="$(mktemp ./temp.sh.XXX)"
  chmod 744 "$temp"
  curl -fsSL "https://raw.githubusercontent.com/aegatlin/notes/master/$1" > "$temp"
  source "$temp"
}

_clean_up () {
  rm temp.sh.*
}

setup