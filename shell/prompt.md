# PS1 / PROMPT

The `PS1` env var controls the look of the terminal prompt. In `zsh` the env var is also call `PROMPT`. Prompt variables for `zsh` can be found [here](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion).

## Some Easy Prompt Variables

* Display the current directory: `%~`
* Display date and time: `%D %T`
* Display a newline: `$'\n'`
* Display username: `%n`
* Display hostname
  * `%M` displays the full hostname
  * `%m` displays the hostname up to the first `.`

## Display the current git branch

This is not easy. There is a `zsh` function called `vcs_info` that exists in the env. You need to enable its usage by using `autoload -Uz vcs_info`. According to [the docs](http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html), the `-U` flag suppresses alias expansion. I guess this is to prevent a scenario where you wrote an alias independently that happened to be the name of a variable used within the vcs_info function itself. It could then alias-expand into something not intended. The `-z` flag indicates that you should autoload the function in a `zsh` friendly way, as opposed to a `ksh` friendly way. I don't know why that wouldn't be assumed, but I'm trusting [this blog post](https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/). This is step one, and should be added to `.zshrc`.

```text
autoload -Uz vcs_info
...
```

Now you need to run the `vcs_info` function each time you display the prompt. To do this, use `pre_cmd`, which is a [hook function](http://zsh.sourceforge.net/Doc/Release/Functions.html) that executes right before the prompt is displayed, and is built in to `zsh` for just this purpose.

```text
autoload -Uz vcs_info
precmd() { vcs_info }
...
```

Once executed, you now have access to an env var that tells you the branch you are on. You first need to set the option to allow for variable substitution in the prompt, `setopt prompt_subst`, and then add the variable to the prompt. Make sure to use **single quotes**, it affects the way substitutions happen \(I don't fully understand it, though\). Here is a prompt with _just_ the branch set:

```text
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
export PROMPT='${vcs_info_msg_0_} c> '
```

In it's current state the output will look like this on master: `(git)-[master]- c>`. To format the output, you will need to use `zstyle` \([docs here](http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#vcs_005finfo-Quickstart)\). It's a bit magical, and I leaned heavily on [this blog post](https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html) to build my intuition on syntax here, but basically you need to tell `zstyle` how to format the output for your vcs of choice, e.g., `git`. I just want the branch name, so I'm using `zstyle ':vcs_info:git*' formats "%b"`. So, all summed up, with the rest of the prompt represented by `[content]`:

```text
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

```text
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "%b"
precmd() { vcs_info }
setopt prompt_subst
export PROMPT=$'\n''%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'$'\n''%F{cyan}%D %T%f '
```
