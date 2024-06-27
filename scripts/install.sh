#!/bin/sh

# Define variables
REPO_URL="https://github.com/moktavizen/material-darker-jdownloader/archive/refs/heads/main.zip"
INSTALL_DIR="$HOME/.jd"
FPAK_INSTALL_DIR="$HOME/.var/app/org.jdownloader.JDownloader/data/jdownloader"
THEME_DIR="material-darker-jdownloader-main"
ZIP_FILE="material-darker-jdownloader.zip"

# Download the zip file
echo "Downloading theme..."
curl -sLo $ZIP_FILE $REPO_URL

# Check if the download was successful
if [ ! -f "$ZIP_FILE" ]; then
	echo "Failed to download the repository."
	exit 1
fi

# Extract the zip file
echo "Extracting theme..."
unzip -qq $ZIP_FILE

# Copy the theme files
echo "Installing theme..."
if [ -d "$INSTALL_DIR" ]; then
	if [ ! -d "$INSTALL_DIR/themes/standard/org/jdownloader" ]; then
		mkdir -p "$INSTALL_DIR/themes/standard/org/jdownloader"
	fi
	if [ ! -d "$INSTALL_DIR/cfg" ]; then
		mkdir -p "$INSTALL_DIR/cfg"
	fi
	if [ ! -d "$INSTALL_DIR/libs/laf" ]; then
		mkdir -p "$INSTALL_DIR/libs/laf"
	fi

	cp -r "$THEME_DIR/images" "$INSTALL_DIR/themes/standard/org/jdownloader/"
	cp -r "$THEME_DIR/laf" "$INSTALL_DIR/cfg/"
	cp "$THEME_DIR/flatlaf.jar" "$INSTALL_DIR/libs/laf/"
fi

if [ -d "$FPAK_INSTALL_DIR" ]; then
	if [ ! -d "$FPAK_INSTALL_DIR/themes/standard/org/jdownloader" ]; then
		mkdir -p "$FPAK_INSTALL_DIR/themes/standard/org/jdownloader"
	fi
	if [ ! -d "$FPAK_INSTALL_DIR/cfg" ]; then
		mkdir -p "$FPAK_INSTALL_DIR/cfg"
	fi
	if [ ! -d "$FPAK_INSTALL_DIR/libs/laf" ]; then
		mkdir -p "$FPAK_INSTALL_DIR/libs/laf"
	fi

	cp -r "$THEME_DIR/images" "$FPAK_INSTALL_DIR/themes/standard/org/jdownloader/"
	cp -r "$THEME_DIR/laf" "$FPAK_INSTALL_DIR/cfg/"
	cp "$THEME_DIR/flatlaf.jar" "$FPAK_INSTALL_DIR/libs/laf/"
fi

# Clean up
rm -rf $THEME_DIR $ZIP_FILE

echo "Theme files installed successfully."
