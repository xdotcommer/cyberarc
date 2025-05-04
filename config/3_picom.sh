#!/bin/bash

# Create picom config directory
mkdir -p ~/.config/picom

# Create cyberpunk-optimized picom config
cat > ~/.config/picom/picom.conf << 'EOL'
# Cyberpunk-optimized picom config

# Shadows
shadow = true;
shadow-radius = 12;
shadow-offset-x = -12;
shadow-offset-y = -12;
shadow-opacity = 0.7;
shadow-color = "#000000";

# Fading
fading = true;
fade-in-step = 0.03;
fade-out-step = 0.03;
fade-delta = 5;

# Transparency
inactive-opacity = 0.8;
frame-opacity = 0.9;
inactive-opacity-override = false;
active-opacity = 1.0;

# Corners
corner-radius = 10;
rounded-corners-exclude = [
  "window_type = 'dock'",
  "window_type = 'desktop'"
];

# Blur
blur-background = true;
blur-method = "dual_kawase";
blur-strength = 6;

# Glow effect
shadow-exclude = [
  "! name~=''"
];

# Wintypes
wintypes:
{
  tooltip = { fade = true; shadow = true; opacity = 0.9; focus = true; };
  dock = { shadow = false; };
  dnd = { shadow = false; };
  popup_menu = { opacity = 0.9; };
  dropdown_menu = { opacity = 0.9; };
};

# Backend
backend = "glx";
vsync = true;
glx-no-stencil = true;
glx-no-rebind-pixmap = true;
EOL