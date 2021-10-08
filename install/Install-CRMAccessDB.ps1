if(!(Get-Item c:\crm)) {
    New-Item -ItemType Directory -Path c:\crm\
}

Copy-Item -Path "\\Q-server\installs\CRM\QuintesCRM.accdb" -Destination "C:\crm\"
Copy-Item -Path "\\Q-server\installs\CRM\Autoupdater.exe"
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("%CommonDesktopDir%\QuintesCRM")
$Shortcut.TargetPath = "C:\crm\QuintesCRM.accdb"
$Shortcut.IconLocation = "\\Q-server\installs\CRM\Desktop_Icon\Access.ico"
$Shortcut.Save()
