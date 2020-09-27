# Links

- [Conditional Expressions](http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html)
- [Arithmetic Evaluation](http://zsh.sourceforge.net/Doc/Release/Arithmetic-Evaluation.html)

## Login Shell

Make sure to run your terminal as a `login shell`

Be sure to set Run command as login shell in Terminal Preferences. Doing so means Terminal will now run ~/.profile on startup. The default ~/.profile on Ubuntu adds, amongst other things, \$HOME/.local/bin to PATH, which is where, amongst other things, pipenv lives.

### \$?

It will return the exit status of the last ran function.

For example:

```bash
> which lsof
/usr/sbin/lsof
> echo $?
0 ## this is good
> which
> echo $?
1 ## this is bad (because no argument was provided)
> +
zsh: command not found: +
> echo $?
127 ## all non-zero numbers are bad. 127 means command not found.
```

## $1, $2, etc

These are shell variable references used inside of bash functions.

For example:

```bash
> myecho () { echo $1 }
> myecho hey
hey
```

## if

`if` is syntactically hard to read. Here's a good [cheatsheet](https://devhints.io/bash#conditionals) for it.

- `if [[ -z "string" ]];` will evaluate if the string is EMPTY.
- `if [[ ! -z "string" ]];` will evaluate if the string is NOT EMPTY.

## Useful bash functions

### kill_pid_on_port()

```bash
> ./kill_pid_on_port :3000
```

1. Checks for the presence of `lsof`
   - There's a very small chance that `lsof` does NOT exist on some thin cloud containers.
   - It is if-checking the non-emptyness (`! -z`) of the path to the executable `command -v lsof`.
2. Check for a process (i.e., an open network file) listening on the provided port.
3. Kill that PID! Sig 9 hardcore! XD

```bash
#!/bin/bash

kill_pid_on_port () {
  if [ ! -z $(command -v lsof) ]; then
    if [[ ! -z $(lsof -nti $1) ]]; then
      kill -9 $(lsof -nti $1)
    fi
  fi
}
```

### wait_for_pid_death_on_port()

```bash
> ./wait_for_pid_death_on_port :3000
```

1. Checks for the presence of `lsof`
   - There's a very small chance that `lsof` does NOT exist on some thin cloud containers.
   - It is if-checking the non-emptyness (`! -z`) of the path to the executable `command -v lsof`.
2. Check every 1 second to see if the server pid has terminated. Exit when it has.
   - The `else` block is for the the unlikely scenario where there is no `lsof` command, in which case you just sleep for a long time (20 seconds). It's arbitrary, and we all hope it's long enough for the server pid to terminate.

```bash
#!/bin/bash

wait_for_pid_death_on_port () {
  if [ ! -z $(command -v lsof) ]; then
    while [ -z "$SERVER_PID" ]; do
      local SERVER_PID=$(lsof -nti $1)
      sleep 1
    done
  else
    sleep 20
  fi
}

```

## HEREDOC syntax

`<< END ... END` is heredoc syntax. It allows for multiline inputs. `END` is an arbitrary delimiter to tell the shell when to start and stop reading text. It can be anything. E.g., `END`, `EOF`, `DELIMIT`, etc.

```bash
cat << DELIMIT
I am text input
across multiple lines
wow, very impressive
DELIMIT
```

You can write those inputs to a file. For example, in Ubuntu, `~/.bash_aliases` are looked for by default. You can have a script that writes aliases to that file on setup:

```bash
cat << DELIMIT > ~/.bash_aliases
  alias g='git'
  alias ..='cd ..'
  alias nr='npm run'
  ...
DELIMIT
```

## Editing files

1. `cat file1.ext > file2.ext` overwrites the content in `file2.ext` with the contents of `file1.ext`.
1. `cat file1.ext >> file2.ext` appends the content of `file1.ext` to the end of `file2.ext`.
