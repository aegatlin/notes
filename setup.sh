#!/bin/bash

# This is the only function called
# at the top-level of the script.
# It is the last line of the file.
do_setup () {
  _message "Setup initiated"

  if _is_mac; then
    _setup_mac
  fi

  if _is_linux; then
    _setup_linux
  fi

  _message "Setup complete"
}

############################################################
############################################################
# Utils
############################################################
############################################################

_message () {
  echo
  echo "**********"
  echo "$1"
  echo "**********"
  echo
}

_run_command () {
  echo
  if [[ $# -eq 2 ]]; then
    echo "Executing command: $1 ($2)"
  else
    echo "Executing command: $1"
  fi

  $1
  echo
}

_not_has_program () {
  ! command -v $1 1> /dev/null
}

############################################################
############################################################
# Mac
############################################################
############################################################

_is_mac () {
  [[ "$(uname)" = "Darwin" ]]
}

_setup_mac () {
  _message "Mac device detected"

  _setup_brew
  _setup_git # might depend on _setup_brew for `git`
  _setup_asdf # depends on brew for coreutils curl and (maybe) `git`
  _setup_zshrc # depends on brew and asdf
}

_setup_brew () {
  if _not_has_program brew; then
    _message "Installing brew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  _run_command "brew update" "Note: this could take a few minutes."
  _brew_install_or_upgrade coreutils
  _brew_install_or_upgrade curl
  _brew_install_or_upgrade git
  _brew_install_or_upgrade direnv
  _brew_install_or_upgrade mosh
  _brew_install_or_upgrade gpg
}

_brew_install_or_upgrade () {
  if [[ "$(brew list | grep $1)" = "$1" ]]; then
    _run_command "brew upgrade $1"
  else
    _run_command "brew install $1"
  fi
}

_setup_asdf () {
  if _not_has_program asdf; then
    _message "Installing asdf"

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    pushd ~/.asdf || exit
    git checkout "$(git describe --abbrev=0 --tags)"
    popd || exit
  fi

  _run_command "asdf update"
  _run_command "asdf plugin add nodejs"
  _run_command "bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'" \
    "Note: This is desired in order to validate the authenticity of the nodejs library being installed."
  _run_command "asdf install nodejs latest"
  _run_command "asdf global nodejs $(asdf latest nodejs)"

  _asdf_add_latest python
  _asdf_add_latest postgres
  _asdf_add_latest erlang
  _asdf_add_latest elixir
}

_asdf_add_latest () {
  _run_command "asdf plugin add $1"
  _run_command "asdf install $1 latest"
  _run_command "asdf global $1 $(asdf latest $1)"
}

############################################################
############################################################
# Linux
############################################################
############################################################

_is_linux () {
  [[ "$(uname)" = "Linux" ]]
}

_setup_linux () {
  _message "Linux device detected"
  # _message "Changing user shell to zsh"
  # chsh -s /bin/zsh
}

############################################################
############################################################
# Universal
############################################################
############################################################

_setup_git () { 
  git config --global user.email 'austin@gatlin.io'
  git config --global user.name 'Austin Gatlin'
  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.c commit
  git config --global alias.cane 'commit --amend --no-edit'
  git config --global alias.st status
  git config --global alias.lol 'log --oneline'
  git config --global alias.lolg 'log --oneline --graph'  
}

_setup_zshrc () {
  _message "Overriding ~/.zshrc"

  rm ~/.zshrc
  _write_zshrc
  source ~/.zshrc
}

_write_zshrc () {
cat << 'DELIMIT' > ~/.zshrc
##########
# zsh aliases
##########
alias ls='ls -G'
alias ll='ls -al'
alias g='git'
alias ..='cd ..'
alias py='python3'
alias pr='pipenv run'
alias nr='npm run'
alias s='iex -S mix phx.server'

##########
# PROMPT setup
##########
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "%b"
precmd() { vcs_info }
setopt prompt_subst
export PROMPT=$'\n''%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'$'\n''%F{cyan}%D %T%f '

##########
# brew setup
##########
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

##########
# direnv setup
##########
eval "$(direnv hook zsh)"

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

do_setup
