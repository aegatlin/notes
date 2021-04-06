# Vim

## Vim vs alternative

I am using vanilla vim over alternatives, such as neovim or macvim. As of this
writing, the justification in borderline arbitrary. With a desire to improve my
remote-machine programming skills, I am desirous of keeping things as minimal as
possible, and vim with a single (long) .vimrc file is easy to port to different
remote vms. (I'm sure other vim flavors are not too difficult, though.)

## My Vim Stack

- [vim-plug](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation) is a simple plugin manager.

## Notes

- autoload directory
  - The autoload directory will reactively load files as you need them, as opposed to some otherwise upfront load that could result in a slow startup. This is especially relevant for larger libraries, or for when you have many libraries. I understand it as lazy loading, essentially. I.e., load the file only when you are literally about to execute a function from within it. You can be fancy with it via \[automatic installation\]\[vim-plug-auto-install\] in your .vimrc script.

- when you want to reload `.vimrc` without leaving vim, execute `:source ~/.vimrc`
