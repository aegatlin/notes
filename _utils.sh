#!/bin/zsh

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

_is_mac () {
  [[ "$(uname)" = "Darwin" ]]
}

_is_linux () {
  [[ "$(uname)" = "Linux" ]]
}
