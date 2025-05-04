#!/bin/bash

# Create necessary directories
mkdir -p ~/.config/i3
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/rofi
mkdir -p ~/.config/polybar
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/picom
mkdir -p ~/Pictures/Wallpapers

# Clone the configuration repo (optional)
# git clone https://github.com/yourusername/cyberpunk-config.git /tmp/cyberpunk-config

# Install dependencies
sudo pacman -S i3-gaps feh rofi polybar alacritty picom neofetch

# Install fonts
sudo pacman -S ttf-hack-nerd

# Copy configurations from the pasted content
# i3 config
cat > ~/.config/i3/config << 'EOL'
# Cyberpunk i3 configuration
set $mod Mod4

# Cyberpunk colors
set $bg-color            #0a0a0f
set $inactive-bg-color   #1c1c22
set $text-color          #f800f8
set $inactive-text-color #8844aa
set $urgent-bg-color     #00ccff
set $indicator-color     #00ffaa

# Window colors
client.focused          $bg-color           $bg-color           $text-color           $indicator-color
client.unfocused        $inactive-bg-color  $inactive-bg-color  $inactive-text-color  $inactive-bg-color
client.focused_inactive $inactive-bg-color  $inactive-bg-color  $inactive-text-color  $inactive-bg-color
client.urgent           $urgent-bg-color    $urgent-bg-color    $text-color           $urgent-bg-color

# Font for window titles
font pango:Hack Nerd Font 10

# Use $mod+Mouse to drag windows
floating_modifier $mod

# Terminal
bindsym $mod+Return exec alacritty

# Kill focused window
bindsym $mod+Shift+q kill

# Start rofi (program launcher)
bindsym $mod+d exec "rofi -show drun -theme ~/.config/rofi/cyberpunk.rasi"

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

# Split orientation
bindsym $mod+h split h
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

# Resize window mode
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

# i3-gaps specific
gaps inner 10
gaps outer 5
smart_gaps on
smart_borders on

# Set wallpaper
exec_always --no-startup-id feh --bg-fill ~/Pictures/Wallpapers/cyberpunk.jpg

# Start polybar
exec_always --no-startup-id ~/.config/polybar/launch.sh

# Start picom compositor
exec_always --no-startup-id picom -b

# Lock screen
bindsym $mod+shift+x exec i3lock -i ~/Pictures/Wallpapers/cyberpunk-lock.png

# Volume controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle

# Brightness controls
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 10
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 10

# Screenshot
bindsym Print exec --no-startup-id scrot '%Y-%m-%d_%H-%M-%S.png' -e 'mv $f ~/Pictures/Screenshots/'
EOL

# Alacritty config
cat > ~/.config/alacritty/alacritty.yml << 'EOL'
window:
  padding:
    x: 10
    y: 10
  decorations: none
  opacity: 0.85

font:
  normal:
    family: Hack Nerd Font
    style: Regular
  bold:
    family: Hack Nerd Font
    style: Bold
  italic:
    family: Hack Nerd Font
    style: Italic
  size: 10.0

# Cyberpunk color scheme
colors:
  primary:
    background: '#0a0a0f'
    foreground: '#f0f0f0'
  cursor:
    text: '#000000'
    cursor: '#00ffaa'
  normal:
    black:   '#1c1c22'
    red:     '#ff2a6d'
    green:   '#05ffa1'
    yellow:  '#fffc00'
    blue:    '#00bfff'
    magenta: '#cc00ff'
    cyan:    '#00ffff'
    white:   '#f8f8f8'
  bright:
    black:   '#575757'
    red:     '#ff738a'
    green:   '#5fffbc'
    yellow:  '#ffff8a'
    blue:    '#44d4ff'
    magenta: '#e182ff'
    cyan:    '#8afdff'
    white:   '#ffffff'
EOL

# Rofi config
mkdir -p ~/.config/rofi
cat > ~/.config/rofi/cyberpunk.rasi << 'EOL'
* {
    background-color:   #0a0a0f;
    border-color:       #00ffaa;
    text-color:         #f8f8f8;
    font:               "Hack Nerd Font 12";
}

window {
    anchor:     north;
    location:   north;
    width:      100%;
    padding:    4px;
    children:   [ horibox ];
    border:     2px 0px 0px 0px;
    border-color: #ff00aa;
}

horibox {
    orientation: horizontal;
    children:   [ prompt, entry, listview ];
}

listview {
    layout:     horizontal;
    spacing:    5px;
    lines:      100;
}

entry {
    expand:     false;
    width:      10em;
    text-color: #00ffaa;
}

element {
    padding: 0px 2px;
}

element selected {
    background-color: #00ffaa;
    text-color:       #0a0a0f;
}

element-text, element-icon {
    background-color: inherit;
    text-color:       inherit;
}
EOL

# Polybar config
mkdir -p ~/.config/polybar
cat > ~/.config/polybar/config << 'EOL'
[colors]
background = #0a0a0f
background-alt = #1c1c22
foreground = #f8f8f8
foreground-alt = #a5a5a5
primary = #00ffaa
secondary = #ff00aa
alert = #00ccff

[bar/cyberpunk]
width = 100%
height = 27
radius = 0
fixed-center = true

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 2
line-color = ${colors.primary}

border-bottom-size = 2
border-color = ${colors.secondary}

padding-left = 0
padding-right = 2

module-margin-left = 1
module-margin-right = 1

font-0 = "Hack Nerd Font:size=10;2"
font-1 = "Hack Nerd Font:size=12;3"

modules-left = i3
modules-center = date
modules-right = cpu memory eth pulseaudio powermenu

tray-position = right
tray-padding = 2

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

label-mode-padding = 2
label-mode-foreground = #000
label-mode-background = ${colors.primary}

; Active workspace
label-focused = %index%
label-focused-background = ${colors.background-alt}
label-focused-underline= ${colors.primary}
label-focused-padding = 2

; Inactive workspace
label-unfocused = %index%
label-unfocused-padding = 2

; Visible workspace
label-visible = %index%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}

; Urgent workspace
label-urgent = %index%
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

[module/cpu]
type = internal/cpu
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #ff00aa
label = %percentage:2%%

[module/memory]
type = internal/memory
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #00ffaa
label = %percentage_used%%

[module/eth]
type = internal/network
interface = eth0
interval = 3.0

format-connected-underline = #00bfff
format-connected-prefix = " "
format-connected-prefix-foreground = ${colors.foreground-alt}
label-connected = %local_ip%

[module/date]
type = internal/date
interval = 5

date = " %Y-%m-%d"
date-alt = " %Y-%m-%d"

time = %H:%M
time-alt = %H:%M:%S

format-prefix = 
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #cc00ff

label = %date% %time%

[module/pulseaudio]
type = internal/pulseaudio

format-volume = <label-volume> <bar-volume>
label-volume = VOL %percentage%%
label-volume-foreground = ${root.foreground}

label-muted = 🔇 muted
label-muted-foreground = #ff738a

bar-volume-width = 10
bar-volume-foreground-0 = #00ffaa
bar-volume-foreground-1 = #00ffaa
bar-volume-foreground-2 = #00ffaa
bar-volume-foreground-3 = #00ffaa
bar-volume-foreground-4 = #00ffaa
bar-volume-foreground-5 = #fffc00
bar-volume-foreground-6 = #ff2a6d
bar-volume-gradient = false
bar-volume-indicator = |
bar-volume-indicator-font = 2
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}

[module/powermenu]
type = custom/menu

expand-right = true

format-spacing = 1

label-open = 
label-open-foreground = ${colors.secondary}
label-close =  cancel
label-close-foreground = ${colors.secondary}
label-separator = |
label-separator-foreground = ${colors.foreground-alt}

menu-0-0 = reboot
menu-0-0-exec = reboot
menu-0-1 = power off
menu-0-1-exec = poweroff

[settings]
screenchange-reload = true

[global/wm]
margin-top = 5
margin-bottom = 5
EOL

# Polybar launch script
cat > ~/.config/polybar/launch.sh << 'EOL'
#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar cyberpunk &

echo "Polybar launched..."
EOL
chmod +x ~/.config/polybar/launch.sh

# Neofetch config
mkdir -p ~/.config/neofetch
cat > ~/.config/neofetch/config.conf << 'EOL'
# Customize neofetch for cyberpunk look
print_info() {
    info title
    info underline
    
    info "OS" distro
    info "Host" model
    info "Kernel" kernel
    info "Uptime" uptime
    info "Packages" packages
    info "Shell" shell
    info "Resolution" resolution
    info "DE" de
    info "WM" wm
    info "WM Theme" wm_theme
    info "Theme" theme
    info "Icons" icons
    info "Terminal" term
    info "Terminal Font" term_font
    info "CPU" cpu
    info "GPU" gpu
    info "Memory" memory
    
    info cols
}

# Custom colors
colors=(5 13 9 10 12 11)
EOL

# Picom config
cat > ~/.config/picom/picom.conf << 'EOL'
# Cyberpunk-optimized picom config
backend = "glx";
glx-no-stencil = true;
glx-no-rebind-pixmap = true;

# Opacity
active-opacity = 1.0;
inactive-opacity = 0.8;
frame-opacity = 0.7;
inactive-opacity-override = false;

# Blur
blur-background = true;
blur-background-frame = true;
blur-method = "dual_kawase";
blur-strength = 6;

# Fading
fading = true;
fade-delta = 4;
fade-in-step = 0.03;
fade-out-step = 0.03;
no-fading-openclose = false;

# Shadows
shadow = true;
shadow-radius = 12;
shadow-offset-x = -15;
shadow-offset-y = -15;
shadow-opacity = 0.75;
shadow-red = 0.0;
shadow-green = 1.0;
shadow-blue = 0.7;

# Other
mark-wmwin-focused = true;
mark-ovredir-focused = true;
use-ewmh-active-win = true;
detect-rounded-corners = true;
detect-client-opacity = true;
vsync = true;
dbe = false;
unredir-if-possible = false;
focus-exclude = [ ];
detect-transient = true;
detect-client-leader = true;

# Window type settings
wintypes:
{
  tooltip = { fade = true; shadow = true; opacity = 0.9; focus = true; full-shadow = false; };
  dock = { shadow = false; clip-shadow-above = true; };
  dnd = { shadow = false; };
  popup_menu = { opacity = 0.9; };
  dropdown_menu = { opacity = 0.9; };
};
EOL

# Download wallpapers
mkdir -p ~/Pictures/Wallpapers

# Create lock screen wallpaper directory
mkdir -p ~/Pictures/Screenshots

# Fetch wallpapers from the web
echo "Downloading cyberpunk wallpapers..."
wget -q https://source.unsplash.com/1920x1080/?cyberpunk -O ~/Pictures/Wallpapers/cyberpunk.jpg 
wget -q https://source.unsplash.com/1920x1080/?neon -O ~/Pictures/Wallpapers/cyberpunk-lock.png

echo "Configuration complete! Log out and select i3 at the login screen to use your new cyberpunk desktop."
echo "Remember to install additional needed packages with: sudo pacman -S pulseaudio pamixer scrot xbacklight"