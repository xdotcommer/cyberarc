#!/bin/bash

# Create wallpapers directory
mkdir -p ~/Pictures/Wallpapers

# Download cyberpunk wallpapers
# First check if Cyberpunk-Neon repository exists
if [ -d ~/Cyberpunk-Neon ]; then
    echo "Using existing Cyberpunk-Neon repository..."
    if [ -d ~/Cyberpunk-Neon/wallpapers ]; then
        cp -r ~/Cyberpunk-Neon/wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null || echo "No wallpapers found in ~/Cyberpunk-Neon/wallpapers"
    else
        echo "No wallpapers directory found in ~/Cyberpunk-Neon"
    fi
else
    echo "Cyberpunk-Neon repository not found, cloning it..."
    git clone https://github.com/Roboron3042/Cyberpunk-Neon.git ~/Cyberpunk-Neon
    if [ -d ~/Cyberpunk-Neon/wallpapers ]; then
        cp -r ~/Cyberpunk-Neon/wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null || echo "No wallpapers found in ~/Cyberpunk-Neon/wallpapers"
    else
        echo "No wallpapers directory found in ~/Cyberpunk-Neon"
    fi
fi

# Download additional cyberpunk wallpapers from other sources
echo "Downloading additional cyberpunk wallpapers..."
mkdir -p /tmp/cyberpunk-wallpapers
cd /tmp/cyberpunk-wallpapers

# Download wallpapers from popular cyberpunk sources
echo "Downloading selected wallpapers from Unsplash..."
wget -q https://source.unsplash.com/1920x1080/?cyberpunk -O cyberpunk1.jpg
wget -q https://source.unsplash.com/1920x1080/?neon -O cyberpunk2.jpg
wget -q https://source.unsplash.com/1920x1080/?cyber -O cyberpunk3.jpg

# Move all downloaded wallpapers to the Pictures directory
cp -r * ~/Pictures/Wallpapers/ 2>/dev/null

# Clean up
cd ~
rm -rf /tmp/cyberpunk-wallpapers

echo "Wallpapers installation complete. Wallpapers are located in ~/Pictures/Wallpapers/"