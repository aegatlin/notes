# Vim

* Since Vim v6 the MatchIt library has been included by default.

## Vim 8+ vs alt-Vims

I do not understand the upsides of alt-Vims, and so have not, at this time,
chosen to migrate away from vanilla Vim.

## My Vim Stack

- [vim-plug](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation) is a simple plugin manager.

## Notes

- autoload directory
  - The autoload directory will reactively load files as you need them, as opposed to some otherwise upfront load that could result in a slow startup.  This is especially relevant for larger libraries, or for when you have many libraries. I understand it as lazy loading, essentially. I.e., load the file only when you are literally about to execute a function from within it. You can be fancy with it via \[automatic installation\]\[vim-plug-auto-install\] in your .vimrc script.

- when you want to reload `.vimrc` without leaving vim, execute `:source ~/.vimrc`
