# cyberarc system setup

## Starting the System
After setting all this up, you'll need to either:
1. Start X manually if you're not using a display manager:

```bash
startx
```

2. Or if you've installed a display manager like lightdm, reboot and it will start automatically:

```bash
sudo systemctl enable lightdm
sudo reboot
```

## Troubleshooting
* If certain packages give errors, try installing them individually.
* For picom errors, you might need a different version (picom-git from AUR).
* If font awesome icons don't show in polybar, check that ttf-font-awesome is installed.
* If wallpaper doesn't set properly, check the path in the i3 config.