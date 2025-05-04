#!/bin/bash

# Create polybar config directory
mkdir -p ~/.config/polybar

# Create polybar launch script
cat > ~/.config/polybar/launch.sh << 'EOL'
#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar main &

echo "Polybar launched..."
EOL
chmod +x ~/.config/polybar/launch.sh

# Create polybar config
cat > ~/.config/polybar/config << 'EOL'
[colors]
background = #000000
background-alt = #121212
foreground = #00ff00
foreground-alt = #00cc00
primary = #00ffff
secondary = #ff00ff
alert = #ff0000

[bar/main]
width = 100%
height = 24
radius = 0
fixed-center = true

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 2
line-color = ${colors.primary}

border-size = 0
border-color = #00000000

padding-left = 2
padding-right = 2

module-margin-left = 1
module-margin-right = 1

font-0 = "Hack:pixelsize=10;2"
font-1 = "Font Awesome 5 Free:style=Solid:pixelsize=10;2"
font-2 = "Font Awesome 5 Brands:pixelsize=10;2"

modules-left = i3
modules-center = date
modules-right = cpu memory pulseaudio

tray-position = right
tray-padding = 2

cursor-click = pointer
cursor-scroll = ns-resize

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

label-mode-padding = 2
label-mode-foreground = #ffffff
label-mode-background = ${colors.primary}

label-focused = %index%
label-focused-background = ${colors.background-alt}
label-focused-foreground = ${colors.primary}
label-focused-underline= ${colors.primary}
label-focused-padding = 2

label-unfocused = %index%
label-unfocused-padding = 2

label-visible = %index%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}

label-urgent = %index%
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

[module/cpu]
type = internal/cpu
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #00ffff
label = %percentage:2%%

[module/memory]
type = internal/memory
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #ff00ff
label = %percentage_used%%

[module/date]
type = internal/date
interval = 5

date = %Y-%m-%d
date-alt = %Y-%m-%d

time = %H:%M
time-alt = %H:%M:%S

format-prefix = 
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #00ff00

label = %date% %time%

[module/pulseaudio]
type = internal/pulseaudio

format-volume = <label-volume> <bar-volume>
label-volume = VOL %percentage%%
label-volume-foreground = ${root.foreground}

label-muted = muted
label-muted-foreground = #666

bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = |
bar-volume-indicator-font = 2
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}

[settings]
screenchange-reload = true

[global/wm]
margin-top = 0
margin-bottom = 0
EOL