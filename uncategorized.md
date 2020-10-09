# Uncategorized Notes

## Vim

### Vim vs alternative

I am a tool minimalist at heart. I have a naive understanding of the vim ecosystem. For these reasons, I am opting for vanilla vim over alternatives, such as neovim or macvim.

### Vim things

- [vim-plug](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation) is a simple plugin manager.
- [vim cheatsheet](https://devhints.io/vim)
- autoload directory
  - The autoload directory will reactively load files as you need them, as opposed to some otherwise upfront load that could result in a slow startup. This is especially relevant for larger libraries, or for when you have many libraries. I understand it as lazy loading, essentially. I.e., load the file only when you are literally about to execute a function from within it. You can be fancy with it via \[automatic installation\]\[vim-plug-auto-install\] in your .vimrc script.
- when you want to reload `.vimrc` without leaving vim, execute `:source ~/.vimrc`

## tmux

- beginner's guide
  - Introduction to tmux: [https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
  - Starter guide on ~/.tmux.conf: [https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/](https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/)
- cheat sheet: [https://tmuxcheatsheet.com/](https://tmuxcheatsheet.com/)

## Elixir

### Links

- A proposal for using contexts | [blog post](http://www.devonestes.com/a-proposal-for-context-rules)

### Mix

- Remove old deps \([learned from here](https://til.hashrocket.com/posts/biytzjjppd-how-to-remove-unused-deps-from-mixlock)\)

  ```bash
  mix deps.clean --unlock --unused
  ```

## Progressive Web Apps \(PWA\)

Example `manifest.json` file:

```text
{
    "name": "",
    "scope": "/",
    "display": "standalone",
    "start_url": "https://example.com/",
    "short_name": "",
    "theme_color": "transparent",
    "description": "",
    "orientation": "any",
    "background_color": "transparent",
    "related_applications": [],
    "prefer_related_applications": false,
    "icons": []
}
```

## VSCode

VSCode settings can be found here:

`~/.config/Code/User/settings.json` `~/.config/Code/User/keybindings.json`

## Postgresql

You will need to create a default database, this is often a database called "postgres", but if you wanted to name it after your username, you could use this command:

```bash
> sudo -u postgres createuser --createdb $(whoami)
```

## Helpful articles

When an article actually helps me understand something in a way I haven't before...

- [CSRF](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html#token-based-mitigation)
- [ECS](https://dev.to/yos/entity-component-systems-in-elixir--2cph)

## Linux One-Liners

- Information about which Linux distribution you're on

  ```text
  lsb_release --all
  ```

## ImageMagick

- Use [ImageMagick](https://imagemagick.org/index.php)'s `convert` tool to reduce the file size of an image without really affecting resolution:

  ```text
  convert filename.jpg -quality 50% filename.jpg
  ```
