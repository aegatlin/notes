# direnv

## Installing [direnv](https://direnv.net/)

You need to setup the appropriate [hook](https://direnv.net/docs/hook.html).

### Understanding the hook

An example hook for bash is:

```bash
> echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

- `direnv hook bash` generates some special direnv bash functions
- `"$(direnv hook bash)"` string interpolates said functions
- `eval "$(direnv hook bash)"` evaluates the string of said functions as if you had just manually typed the function in to the terminal.
- `echo 'eval "$(direnv hook bash)"' >> ~/.bashrc` writes the string `eval "$(direnv hook bash)"` in to your `~/.bashrc` file so that `eval "$(direnv hook bash)"` will be evaluated every time you open a new terminal.
