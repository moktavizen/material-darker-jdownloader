

# Define variables
$THEME_URL = "https://github.com/moktavizen/material-darker-jdownloader/archive/refs/heads/main.tar.gz"
$EXTRACT_DIR = "material-darker-jdownloader-main"
$INSTALL_DIR = "$env:USERPROFILE\.jd"

# Download and extract the zip file
Write-Host "Downloading and extracting theme..."
Invoke-WebRequest -Uri $THEME_URL -OutFile "temp.tar.gz"
tar -xzf temp.tar.gz
Remove-Item temp.tar.gz

# Function to create directories and copy files
function Install-Theme
{
    param (
        [string]$InstallDir
    )
    # New-Item -Path "$InstallDir\themes\standard\org\jdownloader", "$InstallDir\cfg", "$InstallDir\libs\laf" -ItemType Directory -Force | Out-Null
    md "$InstallDir\themes\standard\org\jdownloader", "$InstallDir\cfg", "$InstallDir\libs\laf"
    Copy-Item -Path "$EXTRACT_DIR\images" -Destination "$InstallDir\themes\standard\org\jdownloader\" -Recurse -Force
    Copy-Item -Path "$EXTRACT_DIR\laf" -Destination "$InstallDir\cfg\" -Recurse -Force
    Copy-Item -Path "$EXTRACT_DIR\flatlaf.jar" -Destination "$InstallDir\libs\laf\" -Force
}

# Install theme
Write-Host "Installing theme..."
if (Test-Path $INSTALL_DIR)
{
    Install-Theme -InstallDir $INSTALL_DIR
}

# Clean up
Remove-Item -Path $EXTRACT_DIR -Recurse -Force

Write-Host "Theme files installed successfully"
