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