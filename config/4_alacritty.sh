#!/bin/bash

# Create alacritty config directory
mkdir -p ~/.config/alacritty

# Create cyberpunk config for alacritty
cat > ~/.config/alacritty/alacritty.yml << 'EOL'
# Cyberpunk Neon theme for Alacritty

window:
  padding:
    x: 10
    y: 10
  decorations: full
  opacity: 0.9

font:
  normal:
    family: Hack
    style: Regular
  bold:
    family: Hack
    style: Bold
  italic:
    family: Hack
    style: Italic
  bold_italic:
    family: Hack
    style: Bold Italic
  size: 10.0

# Cyberpunk Neon colors
colors:
  primary:
    background: '#000000'
    foreground: '#00ff00'
  cursor:
    text: '#000000'
    cursor: '#00ff00'
  normal:
    black:   '#000000'
    red:     '#ff0000'
    green:   '#00ff00'
    yellow:  '#ffff00'
    blue:    '#0000ff'
    magenta: '#ff00ff'
    cyan:    '#00ffff'
    white:   '#ffffff'
  bright:
    black:   '#808080'
    red:     '#ff0000'
    green:   '#33ff33'
    yellow:  '#ffff33'
    blue:    '#3333ff'
    magenta: '#ff33ff'
    cyan:    '#33ffff'
    white:   '#ffffff'

background_opacity: 0.9

cursor:
  style: Block
  unfocused_hollow: true

live_config_reload: true
EOL