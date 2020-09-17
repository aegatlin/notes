# Notes

The [wiki](https://github.com/aegatlin/notes/wiki) contains tech notes, and is independent of this repo.

## Setup

Use the appropriate script for the machine in question.

- Local macbook:

```bash
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/aegatlin/notes/master/setup_scripts/local_mac.sh)"
```

- Remote ubuntu (for ipad):

```bash
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/aegatlin/notes/master/setup_scripts/remote_ubuntu.sh)"
```

### Using a tool on a machine

In the most general terms, if I want to use a tool on a machine, whether it be local or remote, that I am in control of, I will perform the following steps:

1. `install`
      I will put the tool on the machine.
1. `setup`
      I will run arbitrary code on the machine.
1. `augment`
      I will _sometimes_ augment settings or systems on my machine.
1. `initiate`
      I will _sometimes_ bootstrap or initiate the tool

I hypothesize that every tool I use, and across every machine I use, these four steps will successfully encapsulate the process of using a tool on my machine.

### Interleaving steps

The complexities of machine setup come with the interplay between tools. One analogy would be that the OS is the blank canvas and each tool you want to use on your machine/OS is paint of a certain color. How you paint the canvas depends on the colors of paint you choose, but also on how you mix and match the colors to achieve the work of art that is your machine setup. Given two tools, `a` and `b`, it could be that `b` cannot be installed without `a` already being setup, but also, you have to `augment` your machine with `a` in a fashion that should occur after `b` has been set up and has augmented the machine. Such a scenario could be scripted as follows, if we assume neither `a` nor `b` require an initiation phase:

```/bin/zsh
a_install
a_setup
b_install
b_setup
b_augment
a_augment
```

### Yet Another Setup Script Paradigm

A setup scripting paradigm that is general, yet capable of addressing the intricacies of arbitrary tooling, and that also respects the interleaving nature of tooling setup, is desirable. Additionally, other principles are desired, such as simplicity, remote execution, and idempotency.

For any tool you want to use, define the above "public" functions as needed. The important point is to **not** deviate from the above "public" functions. (I currently waiver over whether or not some sort of `ensure` function should be public. It will be teased out through experience, I hope.)

### Principles

- Remote

   Got curl? Got zsh? Get setup.

- Modular and Personal

   This isn't something you really need to clone or fork. Create your own modular scripts. Your preferences and environments change over time. Want to try a new setup? Create some new scripts!

- Unobtrusive

   No auto-updates to package managers, no auto-upgrades to libraries. That said, **these scripts will destroy and recreate your .zshrc (etc.) file each time**.

- Idempotent

   That is, running it twice has the same effect as running it once.
