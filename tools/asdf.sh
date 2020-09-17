#!/bin/zsh

##########
# Asdf public functions
##########
# install, setup, augment
##########

asdf__install () {
  if ! __has_command asdf; then
    __message "Installing asdf"

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    pushd ~/.asdf || exit
    git checkout "$(git describe --abbrev=0 --tags)"
    popd || exit
  fi
}

asdf__setup () {
  __run_command "asdf update"
  _asdf__ensure_plugin_add nodejs
  # _run_command "asdf plugin add nodejs"
  # _run_command "bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'" \
  #   "Note: This is desired in order to validate the authenticity of the nodejs library being installed."
  # _run_command "asdf install nodejs latest"
  # _run_command "asdf global nodejs $(asdf latest nodejs)"

  _asdf__ensure_plugin_add python
  _asdf__ensure_plugin_add postgres
  _asdf__ensure_plugin_add erlang
  _asdf__ensure_plugin_add elixir
}

_asdf__ensure_plugin_add () {
  if ! asdf plugin list | grep -q "$1"; then
    __run_command "asdf plugin add $1"
    # _run_command "asdf install $1 latest"
    # _run_command "asdf global $1 $(asdf latest $1)"
  fi
}

asdf__augment () {
  _asdf_append_to_zshrc
}

_asdf_append_to_zshrc() {
cat << DELIMIT >> ~/.zshrc
##########
# asdf setup
##########
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

DELIMIT
}