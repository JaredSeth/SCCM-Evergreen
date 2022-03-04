# Determine available version number
$uri = 'https://notepad-plus-plus.org/'
            $nppURL = (Invoke-WebRequest -Uri $uri -UseBasicParsing)
            $nppLink = ($nppURL.Links | Where-Object outerHTML -Match "Current Version")
            $nppVersionLink = "https://notepad-plus-plus.org" + $nppLink.href
            $version = $nppVersionLink.TrimStart("https://notepad-plus-plus.org/downloads/v").TrimEnd("/")
			
# Switch to Registry PSDrive
Set-Location HKLM:\SOFTWARE

# Determine if software is installed and version number
if ((Test-Path "Microsoft\Windows\CurrentVersion\Uninstall\Notepad++") -eq $true) {
    
	# Determine Installed version
    $appVersion = (Get-ItemPropertyValue -Path 'Microsoft\Windows\CurrentVersion\Uninstall\Notepad++\' -Name DisplayVersion)
    
	# Compare Available Version to Display Version
    if ($version -eq $appVersion)
    {write-host "Installed"}
else {
}
}
