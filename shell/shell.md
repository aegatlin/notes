# Shell

## Links

* [Conditional Expressions](http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html)
* [Arithmetic Evaluation](http://zsh.sourceforge.net/Doc/Release/Arithmetic-Evaluation.html)

## Login Shell

Make sure to run your terminal as a `login shell`

Be sure to set Run command as login shell in Terminal Preferences. Doing so means Terminal will now run ~/.profile on startup. The default ~/.profile on Ubuntu adds, amongst other things, $HOME/.local/bin to PATH, which is where, amongst other things, pipenv lives.

## if statements

`if` is syntactically hard to read. Here's a good [cheatsheet](https://devhints.io/bash#conditionals) for it.

* `if [[ -z "string" ]];` will evaluate if the string is EMPTY.
* `if [[ ! -z "string" ]];` will evaluate if the string is NOT EMPTY.

## Editing files

1. `cat file1.ext > file2.ext` overwrites the content in `file2.ext` with the contents of `file1.ext`.
2. `cat file1.ext >> file2.ext` appends the content of `file1.ext` to the end of `file2.ext`.

