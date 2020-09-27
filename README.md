# Notes

This is a repository of personal tech notes.

Please visit [notes](https://austin-e-gatlin.gitbook.io/notes/) on [Gitbook](https://www.gitbook.com/) to explore.

## Uncategorized notes

### Helpful articles

When an article actually helps me understand something in a way I haven't before...

- [CSRF](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html#token-based-mitigation)

### Linux One-Liners

- Information about which Linux distribution you're on

  ```text
  lsb_release --all
  ```

### ImageMagick

- Use [ImageMagick](https://imagemagick.org/index.php)'s `convert` tool to reduce the file size of an image without really affecting resolution:

  ```text
  convert filename.jpg -quality 50% filename.jpg
  ```
