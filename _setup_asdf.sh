#!/bin/bash

_setup_asdf () {
  if _not_has_program asdf; then
    _message "Installing asdf"

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    pushd ~/.asdf || exit
    git checkout "$(git describe --abbrev=0 --tags)"
    popd || exit
  fi

  _run_command "asdf update"
  _ensure_asdf_plugin_add nodejs
  # _run_command "asdf plugin add nodejs"
  # _run_command "bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'" \
  #   "Note: This is desired in order to validate the authenticity of the nodejs library being installed."
  # _run_command "asdf install nodejs latest"
  # _run_command "asdf global nodejs $(asdf latest nodejs)"

  _ensure_asdf_plugin_add python
  _ensure_asdf_plugin_add postgres
  _ensure_asdf_plugin_add erlang
  _ensure_asdf_plugin_add elixir
}

_ensure_asdf_plugin_add () {
  if ! asdf plugin list | grep -q "$1"; then
    _run_command "asdf plugin add $1"
    # _run_command "asdf install $1 latest"
    # _run_command "asdf global $1 $(asdf latest $1)"
  fi
}