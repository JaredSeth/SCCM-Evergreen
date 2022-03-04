# Locate download URL
$URL = ((Invoke-WebRequest 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58494' -UseBasicParsing).Links | Where-Object href -like '*PBIDesktopSetup_x64.exe')[0].href

# Define Output File Name
$output = "$PSScriptRoot\PBIDesktopSetup_x64.exe"

# Download Installer
Invoke-WebRequest -Uri $URL -OutFile $output

# Install Software
Start-Process -Wait -FilePath "PBIDesktopSetup_x64.exe" -ArgumentList '-s ACCEPT_EULA=1'
