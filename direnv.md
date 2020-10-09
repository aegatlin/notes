# Direnv

[Direnv](https://direnv.net/) allows you to write a `.envrc` file that contains env vars that pertain precisely to the directory/src code you want it to. It writes the env vars to the global env only until you navigate away from the directory, at which point it removes them. This keeps your global `env` minimal and clean.

## Install

After installing the package via some apprpriate package manager for your system, you then need to activate the appropriate [hook](https://direnv.net/docs/hook.html) based on your shell.

### Understanding the hook

An example hook for bash is:

```bash
> echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

- `direnv hook bash` generates some special direnv bash functions
- `"$(direnv hook bash)"` string interpolates said functions
- `eval "$(direnv hook bash)"` evaluates the string of said functions as if you had just manually typed the function in to the terminal.
- `echo 'eval "$(direnv hook bash)"' >> ~/.bashrc` writes the string `eval "$(direnv hook bash)"` in to your `~/.bashrc` file so that `eval "$(direnv hook bash)"` will be evaluated every time you open a new terminal.
