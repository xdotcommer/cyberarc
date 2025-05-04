#!/bin/bash

# Install conky
sudo pacman -S conky

# Create conky config directory
mkdir -p ~/.config/conky

# Create cyberpunk conky config
cat > ~/.config/conky/conky.conf << 'EOL'
conky.config = {
    alignment = 'top_right',
    background = true,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = '00ff00',
    default_outline_color = '00ff00',
    default_shade_color = '000000',
    double_buffer = true,
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    extra_newline = false,
    font = 'Hack:size=10',
    gap_x = 30,
    gap_y = 60,
    minimum_height = 5,
    minimum_width = 5,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = false,
    out_to_ncurses = false,
    out_to_stderr = false,
    out_to_x = true,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'desktop',
    own_window_transparent = false,
    own_window_argb_visual = true,
    own_window_argb_value = 180,
    own_window_colour = '000000',
    show_graph_range = false,
    show_graph_scale = false,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    use_xft = true,
}

conky.text = [[
${color cyan}SYSTEM ${hr 2}$color
${color yellow}Hostname:$color $nodename
${color yellow}Kernel:$color $kernel
${color yellow}Uptime:$color $uptime

${color magenta}CPU ${hr 2}$color
${color yellow}CPU Usage:$color $cpu%
${color yellow}CPU Temp:$color ${exec sensors | grep 'Core 0' | awk '{print $3}'}
${cpugraph 40,250 00ff00 ff00ff -t}
${color yellow}CPU1:$color ${cpu cpu1}% ${cpubar cpu1}
${color yellow}CPU2:$color ${cpu cpu2}% ${cpubar cpu2}

${color cyan}MEMORY ${hr 2}$color
${color yellow}RAM:$color $mem/$memmax - $memperc%
${membar}
${color yellow}Swap:$color $swap/$swapmax - $swapperc%
${swapbar}

${color magenta}STORAGE ${hr 2}$color
${color yellow}Root:$color ${fs_used /}/${fs_size /}
${fs_bar /}

${color cyan}NETWORK ${hr 2}$color
${color yellow}Local IP:$color ${addr wlp2s0}
${color yellow}Download:$color ${downspeed wlp2s0}
${downspeedgraph wlp2s0 40,250 00ff00 ff00ff -t}
${color yellow}Upload:$color ${upspeed wlp2s0}
${upspeedgraph wlp2s0 40,250 00ff00 ff00ff -t}

${color magenta}PROCESSES ${hr 2}$color
${color yellow}Total:$color $processes  ${color yellow}Running:$color $running_processes
${color yellow}Name                CPU%   MEM%$color
${top name 1} ${top cpu 1} ${top mem 1}
${top name 2} ${top cpu 2} ${top mem 2}
${top name 3} ${top cpu 3} ${top mem 3}
]]
EOL

# Add conky to autostart in i3 config
echo "exec --no-startup-id conky" >> ~/.config/i3/config