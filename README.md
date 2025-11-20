# Material Darker JDownloader

![theme preview](./preview.webp)

## Installation 🛠️

> [!WARNING]
> Installing this theme will change your settings! Create a
> [backup](https://support.jdownloader.org/en/knowledgebase/article/backup-restore-configuration)
> if you want to restore later.

1. [Download the zip](https://github.com/moktavizen/material-darker-jdownloader/releases/download/v25.11/material-darker-jdownloader-2511.zip)
   from the release page and extract it.

2. In your JDownloader, Click on `File > Backup > Restore settings`, and select
   `cfg.jd2backup`

3. Follow the pop-up instruction.

4. See Your `JD_DIR` in `Help > About JDownloader > Click me /
   Mouse over`, then copy:

   - `flatlaf.jar` to `JD_DIR/libs/laf`
   - `images` to `JD_DIR/themes/standard/org/jdownloader`

   Choose replace for any conflicts.

5. Restart JDownloader.

## FAQ 📑

### How to change the progress bar color?

See https://github.com/moktavizen/material-darker-jdownloader/issues/14#issuecomment-3551113789.

### Why my font and UI is small? Why the font scale setting doesn't work?

In your `<install-dir>`, create or edit `JDownloader2.vmoptions`
then add

```
-Dsun.java2d.uiScale=200%
```

For Linux, make sure you install JDownloader using the script from
[JDownloader Website](https://jdownloader.org/download/index), `vmoptions`
sometimes is not recognized if you install it using Flatpak, AUR, etc. Proper
HighDPI support is in the works. See this
[thread](https://board.jdownloader.org/showthread.php?p=532602#post532602) and
[article](https://support.jdownloader.org/en/knowledgebase/article/high-dpi-support)
for more details.

## Acknowledgments 👍

- [Material Theme](https://github.com/t3dotgg/vsc-material-but-i-wont-sue-you) for color inspiration.
- [FlatLaf](https://github.com/JFormDesigner/FlatLaf) for base theme.
- [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme), [Material Design](https://fonts.google.com/icons), [Font Awesome](https://fontawesome.com/), [SVG Repo](https://www.svgrepo.com/) for icons.
