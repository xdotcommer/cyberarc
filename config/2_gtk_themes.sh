#!/bin/bash

# Create theme directories
mkdir -p ~/.themes ~/.icons ~/.config/polybar

# Clone Cyberpunk-Neon theme repository
git clone https://github.com/Roboron3042/Cyberpunk-Neon.git
cd Cyberpunk-Neon

# Install GTK theme 
# The file is named materia-cyberpunk-neon.zip in the repository
mkdir -p ~/.themes
if [ -f gtk/materia-cyberpunk-neon.zip ]; then
    cp gtk/materia-cyberpunk-neon.zip ~/.themes/
    cd ~/.themes
    unzip materia-cyberpunk-neon.zip
    rm materia-cyberpunk-neon.zip
elif [ -f gtk/materia-cyberpunk-neon.tar.gz ]; then
    tar xzf gtk/materia-cyberpunk-neon.tar.gz -C ~/.themes/
else
    echo "GTK theme file not found. Downloading directly..."
    wget -O ~/.themes/materia-cyberpunk-neon.zip https://github.com/Roboron3042/Cyberpunk-Neon/raw/master/gtk/materia-cyberpunk-neon.zip
    cd ~/.themes
    unzip materia-cyberpunk-neon.zip
    rm materia-cyberpunk-neon.zip
fi

cd ~/Cyberpunk-Neon

# Install Papirus icons and apply cyberpunk colors
sudo pacman -S papirus-icon-theme

# The papirus-kolorizer.sh script is in the icons directory
if [ -f icons/papirus-kolorizer.sh ]; then
    chmod +x icons/papirus-kolorizer.sh
    ./icons/papirus-kolorizer.sh
elif [ -f papirus-kolorizer.sh ]; then
    chmod +x papirus-kolorizer.sh
    ./papirus-kolorizer.sh
else
    echo "Papirus kolorizer script not found. Creating it..."
    cat > papirus-kolorizer.sh << 'EOL'
#!/bin/bash
# Change Papirus folders color

# Cyberpunk Neon colors
readonly FrontColor="0abdc6"
readonly BackColor="133e7c"
readonly SymbolColor="ea00d9"

# Path to Papirus icon theme
readonly PAPIRUS_DIR="/usr/share/icons/Papirus"
readonly PAPIRUS_DARK_DIR="/usr/share/icons/Papirus-Dark"

# Check if Papirus is installed
if [ ! -d "$PAPIRUS_DIR" ]; then
    echo "Error: Papirus icon theme not found!"
    exit 1
fi

# Apply colors to standard folders
echo "Applying colors to Papirus..."
find "$PAPIRUS_DIR" -type f -name "*.svg" -path "*/places/*" -exec sed -i "s/#5294e2/$FrontColor/gI" {} \;
find "$PAPIRUS_DIR" -type f -name "*.svg" -path "*/places/*" -exec sed -i "s/#4877b1/$BackColor/gI" {} \;

# Apply colors to Papirus-Dark
if [ -d "$PAPIRUS_DARK_DIR" ]; then
    echo "Applying colors to Papirus-Dark..."
    find "$PAPIRUS_DARK_DIR" -type f -name "*.svg" -path "*/places/*" -exec sed -i "s/#5294e2/$FrontColor/gI" {} \;
    find "$PAPIRUS_DARK_DIR" -type f -name "*.svg" -path "*/places/*" -exec sed -i "s/#4877b1/$BackColor/gI" {} \;
fi

echo "Papirus folders are now Cyberpunk Neon themed!"
EOL
    chmod +x papirus-kolorizer.sh
    sudo ./papirus-kolorizer.sh
fi

# Return to home directory
cd ~

echo "Cyberpunk theme installation complete!"
echo "Apply the GTK theme via: Settings -> Appearance -> Application Style"
echo "Apply the icon theme via: Settings -> Appearance -> Icons"