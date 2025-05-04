#!/bin/bash

# Create rofi themes directory
mkdir -p ~/.local/share/rofi/themes/

# Create a cyberpunk theme file
cat > ~/.local/share/rofi/themes/cyberpunk.rasi << 'EOL'
/**
 * Cyberpunk Neon Theme for Rofi
 */

* {
    black:      #000000;
    red:        #ff0000;
    green:      #00ff00;
    yellow:     #ffff00;
    blue:       #0000ff;
    magenta:    #ff00ff;
    cyan:       #00ffff;
    emphasis:   #00ff00;
    text:       #00ff00;
    text-alt:   #00ffff;
    fg:         #00ff00;
    bg:         #000000;

    spacing: 0;
    background-color: transparent;

    font: "Hack 12";
    text-color: @text;
}

window {
    transparency: "real";
    fullscreen: false;
    background-color: #000000ee;
    border: 2px;
    border-color: @green;
    border-radius: 0px;
    width: 50%;
}

mainbox {
    padding: 12px;
    border: 0px;
    border-color: @green;
    border-radius: 0px;
    background-color: transparent;
}

inputbar {
    children: [prompt, entry];
    background-color: @black;
    border: 2px;
    border-color: @green;
    border-radius: 0px;
    padding: 4px;
    margin: 0px 0px 8px 0px;
}

prompt {
    background-color: @green;
    text-color: @black;
    padding: 4px;
    border-radius: 0px;
    margin: 0px 4px 0px 0px;
    enabled: true;
}

entry {
    background-color: transparent;
    text-color: @text;
    placeholder-color: @text-alt;
    placeholder: "Type here...";
    border-radius: 0px;
    padding: 4px;
}

listview {
    background-color: transparent;
    border-radius: 0px;
    border: 0px;
    padding: 0px;
    margin: 0px;
    columns: 1;
    lines: 8;
    fixed-height: false;
    dynamic: true;
    scrollbar: true;
}

scrollbar {
    background-color: @black;
    handle-color: @green;
    handle-width: 4px;
    border: 0px;
    border-radius: 0px;
    padding: 0px;
}

element {
    background-color: transparent;
    text-color: @text;
    border-radius: 0px;
    padding: 4px;
    margin: 2px;
}

element selected {
    background-color: @green;
    text-color: @black;
    border-radius: 0px;
}

element urgent, element selected urgent {
    background-color: @red;
    text-color: @black;
}

element active, element selected active {
    background-color: @cyan;
    text-color: @black;
}

element-icon {
    background-color: transparent;
    text-color: inherit;
    size: 24px;
    padding: 0px 4px 0px 0px;
}

element-text {
    background-color: transparent;
    text-color: inherit;
    highlight: underline #00ffff;
    vertical-align: 0.5;
}

message {
    background-color: @black;
    border: 2px;
    border-color: @green;
    border-radius: 0px;
    padding: 4px;
    margin: 4px 0px 0px 0px;
}

textbox {
    background-color: transparent;
    text-color: @text;
}

error-message {
    background-color: @black;
    border: 2px;
    border-color: @red;
    border-radius: 0px;
    padding: 4px;
}
EOL

touch ~/.config/i3/config

# Update the i3 config to use this theme
sed -i 's/bindsym $mod+d exec rofi -show run -theme cyberpunk-neon/bindsym $mod+d exec rofi -show run -theme cyberpunk/g' ~/.config/i3/config

# Create i3 config (after first running i3-config-wizard once)
cat > ~/.config/i3/config << 'EOL2'
# Cyberpunk i3 config
set $mod Mod4

# Font for window titles
font pango:Hack 10

# Cyberpunk color scheme
# class                 border  backgr. text    indicator child_border
client.focused          #00FF00 #008F11 #FFFFFF #00FF00   #00FF00
client.focused_inactive #333333 #5F676A #FFFFFF #484e50   #5F676A
client.unfocused        #333333 #222222 #888888 #292d2e   #222222
client.urgent           #FF0000 #900000 #FFFFFF #900000   #900000
client.placeholder      #000000 #0c0c0c #FFFFFF #000000   #0c0c0c
client.background       #000000

# Use Mouse+$mod to drag floating windows
floating_modifier $mod

# Start terminal
bindsym $mod+Return exec alacritty

# Kill focused window
bindsym $mod+Shift+q kill

# Start rofi (program launcher)
bindsym $mod+d exec rofi -show run -theme cyberpunk

# Change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# Move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# Split in horizontal orientation
bindsym $mod+h split h

# Split in vertical orientation
bindsym $mod+v split v

# Enter fullscreen mode
bindsym $mod+f fullscreen toggle

# Change container layout
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# Toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# Change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# Focus the parent container
bindsym $mod+a focus parent

# Define workspaces
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# Switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# Move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# Reload the configuration file
bindsym $mod+Shift+c reload

# Restart i3 inplace
bindsym $mod+Shift+r restart

# Exit i3
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'Exit i3?' -B 'Yes' 'i3-msg exit'"

# Resize mode
mode "resize" {
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}
bindsym $mod+r mode "resize"

# Gaps configuration
gaps inner 10
gaps outer 5
smart_gaps on

# Remove window borders
for_window [class="^.*"] border pixel 2

# Autostart applications
exec_always --no-startup-id picom -b
exec_always --no-startup-id ~/.config/polybar/launch.sh
exec_always --no-startup-id feh --bg-fill ~/Cyberpunk-Neon/wallpapers/cyberpunk-neon-city.jpg

# Lock screen
bindsym $mod+shift+x exec i3lock -i ~/Cyberpunk-Neon/wallpapers/cyberpunk-neon-city.png

EOL2
