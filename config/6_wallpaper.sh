#!/bin/bash

# Create wallpapers directory
mkdir -p ~/Pictures/Wallpapers

# Download cyberpunk wallpapers
cd ~/Cyberpunk-Neon
cp -r wallpapers/* ~/Pictures/Wallpapers/

# Add more cyberpunk wallpapers
git clone https://github.com/Roboron3042/Cyberpunk-Neon.git ~/cyberpunk-wallpapers
cp -r ~/cyberpunk-wallpapers/wallpapers/* ~/Pictures/Wallpapers/