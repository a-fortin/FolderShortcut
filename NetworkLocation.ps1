$folderPath = Join-Path $env:APPDATA "\Microsoft\Windows\Network Shortcuts\"
$folderName = "{INSERT-FOLDERNAME}" # ← Modify the name of the network location
$fullPath = Join-Path $folderPath $folderName
New-Item -Path $fullPath -ItemType Directory
$shortcutPath = Join-Path $fullPath "target.lnk"
$networkSharePath = "{INSERT-UNC}" # ← Modify the UNC path of the network location 
$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $networkSharePath 
$shortcut.Save()
$desktopIniPath = Join-Path $fullPath "desktop.ini"
$desktopIniContent = @"
[.ShellClassInfo]
CLSID2={0AFACED1-E828-11D1-9187-B532F1E9575D}
Flags=2
"@
Set-Content -Path $desktopIniPath -Value $desktopIniContent
Set-ItemProperty -Path $fullPath -Name Attributes -Value ([System.IO.FileAttributes]::ReadOnly)
Set-ItemProperty -Path $shortcutPath -Name Attributes -Value ([System.IO.FileAttributes]::ReadOnly)
Set-ItemProperty -Path $desktopIniPath -Name Attributes -Value ([System.IO.FileAttributes]::ReadOnly)
Get-ChildItem -Path $fullPath  -Recurse | ForEach-Object {
    Set-ItemProperty -Path $_.FullName -Name Attributes -Value ([System.IO.FileAttributes]::ReadOnly)
}
