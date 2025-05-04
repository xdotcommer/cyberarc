#!/bin/bash

# Install font awesome for icons
yay -S ttf-font-awesome

# Install additional nice-to-have utilities
sudo pacman -S htop neofetch

# Configure GTK theme
cat > ~/.config/gtk-3.0/settings.ini << 'EOL'
[Settings]
gtk-theme-name=Materia-Cyberpunk-Neon
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=DejaVu Sans 11
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
EOL

# Set up display manager or startx
echo "If using a display manager like lightdm, make sure it's installed and enabled"
echo "If using startx, run 'startx' to start i3"

# Add neofetch to .bashrc for cyberpunk terminal appearance
echo "neofetch" >> ~/.bashrc