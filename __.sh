#!/bin/zsh

__has_command () {
  command -v $1 1> /dev/null
}

__message () {
  echo
  echo "**********"
  echo "$1"
  echo "**********"
  echo
}

__run_command () {
  echo
  if [[ $# -eq 2 ]]; then
    echo "Executing command: $1 ($2)"
  else
    echo "Executing command: $1"
  fi

  eval $1
  echo
}

# __is_mac () {
#   [[ "$(uname)" = "Darwin" ]]
# }

# __is_linux () {
#   [[ "$(uname)" = "Linux" ]]
# }