# HEREDOC

`<< END ... END` is heredoc syntax. It allows for multiline inputs. `END` is an arbitrary delimiter to tell the shell when to start and stop reading text. It can be anything. E.g., `END`, `EOF`, `DELIMIT`, etc.

```text
cat << DELIMIT
I am text input
across multiple lines
wow, very impressive
DELIMIT
```

You can write those inputs to a file.

```text
cat << DELIMIT > ~/.bash_aliases
  ...
DELIMIT
```

## Preventing variable expansion in HEREDOCs

HEREDOCs will expand variables by default. To prevent this, wrap the opening delimiter in quotes.

```text
$ var="hey"

$ cat << DELIMIT
$var
DELIMIT
hey

$ cat << 'DELIMIT'
$var
DELIMIT
$var
```

