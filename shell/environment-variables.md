# Environment Variables

- `$@` is a list of all the parameters passed in to a function
- `$#` is the number of parameters passed in to a function
- `$?` is the exit status of the last ran function

  - 0 is good
  - 1+ is bad

  ```text
  $ which cat
  /bin/cat
  $ echo $?
  0 # This is good
  $ which

  $ echo $?
  1 # This is bad (an error because no argument was provided)
  $ +
  zsh: command not found: +
  $ echo $?
  127 # This is bad too (127 means "command not found")
  ```

- `$1`, `$2`, ... are variables references used inside of functions.

  ```text
  $ myecho() { echo $1 }

  $ myecho "hey"
  "hey"
  ```
