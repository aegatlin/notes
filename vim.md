# Vim

Look, we all don't like it, and we all friggin love it. The sooner we move on with our sad lives the better it will be for everyone.

That's all. Let's go.

## Vanilla vim vs alternative

I'm a minimalist at heart, and so if there's an option, I keep it basic and full of defaults. So, vanilla vim.

## Plugin manager

I've heard from fellow minimalists that [vim-plug](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation) is nice and simple, basic. So, that's what we're going with.

## Vim things

* [vim cheatsheet](https://devhints.io/vim)
* autoload directory
  * The autoload directory will reactively load files as you need them, as opposed to some otherwise upfront load that could result in a slow startup. This is especially relevant for larger libraries, or for when you have many libraries. I understand it as lazy loading, essentially. I.e., load the file only when you are literally about to execute a function from within it. You can be fancy with it via \[automatic installation\]\[vim-plug-auto-install\] in your .vimrc script.
* when you want to reload `.vimrc` without leaving vim, execute `:source ~/.vimrc`

