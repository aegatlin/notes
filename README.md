# Notes

The notes are in the [wiki](https://github.com/aegatlin/notes/wiki) (https://github.com/aegatlin/notes/wiki).

The wiki repo is independent of this repo. To edit the wiki you will need to clone that repo specifically: `git clone https://github.com/aegatlin/notes.wiki.git`.

## Setup

To run the setup script from anywhere, run the following command:

Pick your install

- For a local, mac dev machine:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/aegatlin/notes/master/mac.sh)"
```

- For a remote, linux ubuntu dev machine:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/aegatlin/notes/master/remote_linux.sh)"
```

### Principles

1. Remote

   Got bash? Got curl? Get setup.

1. Modular and Personal

   This isn't something you should clone or fork, create your own modular scripts. You and your environments and preferences change over time. Want to try a new setup? Create some new scripts.

1. Non-obtrusive

   For example, no upgrades if packages/libraries already exist. That being said, **these scripts will destroy your .zshrc (etc.) file**.

1. Idempotent

   That is, running it twice has the same effect as running it once.
