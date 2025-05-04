#!/bin/bash

# Create theme directories
mkdir -p ~/.themes ~/.icons ~/.config/polybar

# Clone Cyberpunk-Neon theme repository
git clone https://github.com/Roboron3042/Cyberpunk-Neon.git
cd Cyberpunk-Neon

# Install GTK theme
cp -r gtk/Materia-Cyberpunk-Neon.tar.gz ~/.themes/
cd ~/.themes
tar xf Materia-Cyberpunk-Neon.tar.gz
rm Materia-Cyberpunk-Neon.tar.gz
cd ~

# Install Papirus icons and apply cyberpunk colors
sudo pacman -S papirus-icon-theme
cd Cyberpunk-Neon
chmod +x papirus-kolorizer.sh
./papirus-kolorizer.sh