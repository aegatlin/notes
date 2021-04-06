# Uncategorized Notes

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
