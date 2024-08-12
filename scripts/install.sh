#!/bin/sh

# Define variables
THEME_URL="https://github.com/moktavizen/material-darker-jdownloader/archive/refs/heads/main.tar.gz"
EXTRACT_DIR="material-darker-jdownloader-main"
INSTALL_DIR="$HOME/.jd"
FPAK_INSTALL_DIR="$HOME/.var/app/org.jdownloader.JDownloader/data/jdownloader"

# Download and extract the zip file
echo "Downloading and extracting theme..."
curl -L "$THEME_URL" | tar -xzf-

# Function to create directories and copy files
install_theme() {
	local install_dir="$1"
	mkdir -p "$install_dir/themes/standard/org/jdownloader" "$install_dir/cfg" "$install_dir/libs/laf"
	cp -r "$EXTRACT_DIR/images" "$install_dir/themes/standard/org/jdownloader/"
	cp -r "$EXTRACT_DIR/laf" "$install_dir/cfg/"
	cp "$EXTRACT_DIR/flatlaf.jar" "$install_dir/libs/laf/"
}

# Install theme
echo "Installing theme..."
[ -d "$INSTALL_DIR" ] && install_theme "$INSTALL_DIR"
[ -d "$FPAK_INSTALL_DIR" ] && install_theme "$FPAK_INSTALL_DIR"

# Clean up
rm -rf "$EXTRACT_DIR"

echo "Theme files installed successfully"
