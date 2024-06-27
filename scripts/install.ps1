# Define variables
$REPO_URL = "https://github.com/moktavizen/material-darker-jdownloader/archive/refs/heads/main.zip"
$INSTALL_DIR = "$HOME\.jd"
$THEME_DIR = "material-darker-jdownloader-main"
$ZIP_FILE = "material-darker-jdownloader.zip"

# Download the zip file
Write-Host "Downloading theme..."
Invoke-WebRequest -Uri $REPO_URL -OutFile $ZIP_FILE

# Check if the download was successful
if (-Not (Test-Path -Path $ZIP_FILE)) {
    Write-Host "Failed to download the repository."
    exit 1
}

# Extract the zip file
Write-Host "Extracting theme..."
Expand-Archive -Path $ZIP_FILE -DestinationPath .

# Copy the theme files
Write-Host "Installing theme..."
if (Test-Path -Path $INSTALL_DIR) {
    if (-Not (Test-Path -Path "$INSTALL_DIR\themes\standard\org\jdownloader")) {
        New-Item -ItemType Directory -Path "$INSTALL_DIR\themes\standard\org\jdownloader" -Force
    }
    if (-Not (Test-Path -Path "$INSTALL_DIR\cfg")) {
        New-Item -ItemType Directory -Path "$INSTALL_DIR\cfg" -Force
    }
    if (-Not (Test-Path -Path "$INSTALL_DIR\libs\laf")) {
        New-Item -ItemType Directory -Path "$INSTALL_DIR\libs\laf" -Force
    }

    Copy-Item -Path "$THEME_DIR\images" -Destination "$INSTALL_DIR\themes\standard\org\jdownloader" -Recurse -Force
    Copy-Item -Path "$THEME_DIR\laf" -Destination "$INSTALL_DIR\cfg" -Recurse -Force
    Copy-Item -Path "$THEME_DIR\flatlaf.jar" -Destination "$INSTALL_DIR\libs\laf" -Force
}

# Clean up
Remove-Item -Path $THEME_DIR -Recurse -Force
Remove-Item -Path $ZIP_FILE -Force

Write-Host "Theme files installed successfully."
