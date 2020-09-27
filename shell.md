# Links

- [Conditional Expressions](http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html)
- [Arithmetic Evaluation](http://zsh.sourceforge.net/Doc/Release/Arithmetic-Evaluation.html)

# PS1 / PROMPT

The `PS1` env var controls the look of the terminal prompt. In `zsh` the env var is also call `PROMPT`. Prompt variables for `zsh` can be found [here][zsh-prompt-docs].

## Display the current directory

Prompt syntax: `%~`

## Display date and time

Prompt syntax: `%D %T`

## Display a newline

Prompt syntax: `$'\n'`

## Display the current git branch

This is not easy. There is a `zsh` function called `vcs_info` that existing in the env. You need to enable its usage by using `autoload -Uz vcs_info`. According to [the docs][zsh-builtins-docs], the `-U` flag suppresses alias expansion. I guess this is to prevent a scenario where you wrote an alias independently that happened to be the name of a variable used within the vcs_info function itself. It could then alias-expand into something not intended. The `-z` flag indicates that you should autoload the function in a `zsh` friendly way, as opposed to a `ksh` friendly way. I don't know why that wouldn't be assumed, but I'm trusting [this blog post][git-prompt-blog-post]. This is step one, and should be added to `.zshrc`.

```zsh
autoload -Uz vcs_info
...
```

Now you need to run the `vcs_info` function each time you display the prompt. To do this, use `pre_cmd`, which is a [hook function][zsh-functions-docs] that executes right before the prompt is displayed, and is built in to `zsh` for just this purpose.

```zsh
autoload -Uz vcs_info
precmd() { vcs_info }
...
```

Once executed, you now have access to an env var that tells you the branch you are on. You first need to set the option to allow for variable substitution in the prompt, `setopt prompt_subst`, and then add the variable to the prompt. Make sure to use **single quotes**, it affects the way substitutions happen (I don't fully understand it, though). Here is a prompt with _just_ the branch set:

```zsh
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
export PROMPT='${vcs_info_msg_0_} c> '
```

In it's current state the output will look like this on master: `(git)-[master]- c> `. To format the output, you will need to use `zstyle` ([docs here][zsh-zstyle-docs]). It's a bit magical, and I leaned heavily on [this blog post][zsh-git-formats-blog-post] to build my intuition on syntax here, but basically you need to tell `zstyle` how to format the output for your vcs of choice, e.g., `git`. I just want the branch name, so I'm using `zstyle ':vcs_info:git*' formats "%b"`. So, all summed up, with the rest of the prompt represented by `[content]`:

```zsh
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "%b"
precmd() { vcs_info }
setopt prompt_subst
export PROMPT='[content]${vcs_info_msg_0_}[content]'
```

## Color

This is a strange syntax. Basically, an `%F` with color specification, e.g., `%F{red}` starts a colored section, and `%f` ends a colored section. Prompt syntax: `%F{color_name}[content to color]%f`. E.g., to display the current directory, `%~`, in red, you'd write `%F{red}%~%f`.

## Final prompt

In `~/.zshrc`, with all the above notes combined:

```zsh
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "%b"
precmd() { vcs_info }
setopt prompt_subst
export PROMPT=$'\n''%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'$'\n''%F{cyan}%D %T%f '
```

[zsh-prompt-docs]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
[zsh-builtins-docs]: http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html
[git-prompt-blog-post]: https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/
[zsh-functions-docs]: http://zsh.sourceforge.net/Doc/Release/Functions.html
[zsh-zstyle-docs]: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#vcs_005finfo-Quickstart
[zsh-git-formats-blog-post]: https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html

# Login Shell

Make sure to run your terminal as a `login shell`

Be sure to set Run command as login shell in Terminal Preferences. Doing so means Terminal will now run ~/.profile on startup. The default ~/.profile on Ubuntu adds, amongst other things, $HOME/.local/bin to PATH, which is where, amongst other things, pipenv lives.

# lsof

It `l`i`s`ts `o`pen `f`iles. Among other things, these open files include network files like internet sockets, UNIX domain sockets, etc.

## `lsof` flags

The following tags are listed in order of personal importance.

* -i
  
  By itself, it will list all the open `i`nternet and network files. Otherwise, it will attempt to match the provided argument, which should be an internet address specified as follows: `[46][protocol][@hostname|hostaddr][:service|port]`. E.g., `:3000`.

* -n

  Tells `lsof` to `n`ot convert IP addresses to hostnames. The lookup times for the hostnames can drastically affect the time it takes to run `lsof`. I'm guessing this is because the `lsof` service has to reach out to the internet and check DNSs until it finds one that knows the hostname of the IP address it's checking against.

  * "Name" column for `lsof -ni`

    `192.168.1.102:64649->52.63.63.51:https (ESTABLISHED)`

  * "Name" column for `lsof -i`
    
    `192-168-1-102.tpgi.com.au:64649->ec2-52-63-63-51.ap-southeast-2.compute.amazonaws.com:https (ESTABLISHED)`

  * -t

    Lists `t`ersely. I.e., it lists just the PIDs.

## `lsof` in Action
`lsof -i :3000` will list every open network file listening on port :3000

`lsof -nti :3000` will list just the PIDs listening on port :3000

`lsof -n | grep LISTEN` will list every listening process/open-file

# $?
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

# $1, $2, etc
These are shell variable references used inside of bash functions.

For example:
```bash
> myecho () { echo $1 }
> myecho hey
hey
```

# if
`if` is syntactically hard to read. Here's a good [cheatsheet](https://devhints.io/bash#conditionals) for it.

* `if [[ -z "string" ]];` will evaluate if the string is EMPTY.
* `if [[ ! -z "string" ]];` will evaluate if the string is NOT EMPTY.

# Useful bash functions

## kill_pid_on_port()
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

## wait_for_pid_death_on_port()
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

# HEREDOC syntax
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

# Editing files

1. `cat file1.ext > file2.ext` overwrites the content in `file2.ext` with the contents of `file1.ext`.
1. `cat file1.ext >> file2.ext` appends the content of `file1.ext` to the end of `file2.ext`.