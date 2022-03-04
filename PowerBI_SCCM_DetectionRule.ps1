# Determine available version number
$version = ((Invoke-WebRequest 'https://www.microsoft.com/download/details.aspx?id=58494' -UseBasicParsing).Content | Select-String -Pattern 'Version:\s+</div><p>(.+)</p>').Matches.Groups[1].Value

# Determine if software is installed
if ((test-path "C:\Program Files\Microsoft Power BI Desktop\bin\PBIDesktop.exe") -eq $true) {
    # Determine Installed version
    $path = "C:\Program Files\Microsoft Power BI Desktop\bin\PBIDesktop.exe"
    $appVersion = (Get-Item $path).VersionInfo.FileVersion

    # Compare Available Version to Display Version
    if ($version -eq $appVersion)
    {write-host "Installed"}

else {
}
}
