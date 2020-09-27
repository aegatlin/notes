Easy reference tech notes for remembering, refreshing, copying and pasting, and more.

# Uncategorized Notes

When an article actually helps me understand something in a way I haven't before...

CSRF: https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html#token-based-mitigation

# VSCode

VSCode settings can be found here:

`~/.config/Code/User/settings.json`
`~/.config/Code/User/keybindings.json`

# Linux One-Liners

* Information about which Linux distribution you're on
    ```bash
    lsb_release --all
    ```

## ImageMagick

* Use [ImageMagick](https://imagemagick.org/index.php)'s `convert` tool to reduce the file size of an image without really affecting resolution:
    ```bash
    convert filename.jpg -quality 50% filename.jpg
    ```
