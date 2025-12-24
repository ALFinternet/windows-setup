# windows-setup
Various Windows Setup Scripts/Files

##
1. Install Windows, Shift+F3 at region selection
2. Run Updates
3. Remove recovery partition (reagentc /disable, diskpart delete part # override
4. Install Apps (Chrome, 7Zip, etc)
5. Organize Start Menu
6. Run Disk Cleanup
7. Run Decrap
8. Run OSPrep
9. Run Sysprep
10. Capture

## os_prep
Fixes various things I don't like with Windows

# Decrapifier
Windows 10 Decrapifier - 18XX/19XX/2XXX

## Recommended Switches:
Recommended switches: -AppAccess -ClearStart -OneDrive -Tablet -Xbox

## Notes
Add apps to not remove in the $GoodApps variable

## Forked From
https://community.spiceworks.com/scripts/show/4378-windows-10-decrapifier-18xx-19xx-2xxx

## My notes
https://winstall.app/apps

https://github.com/microsoft/winget-pkgs/tree/master/manifests

```
Set-ExecutionPolicy Unrestricted
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Install-Module PSWindowsUpdate -Force
Install-Script Update-InboxApp
winget source add -n finchtech -t "Microsoft.Rest" -a https://winget.finchtech.com/wg/
winget upgrade --all
winget install -e --id "7zip.7zip" --silent --accept-package-agreements --accept-source-agreements --verbose-logs
winget install -e --id "VideoLAN.VLC" --silent --accept-package-agreements --accept-source-agreements --verbose-logs
winget install -e --id "Google.Chrome" --silent --accept-package-agreements --accept-source-agreements --verbose-logs -s finchtech
Import-Module PSWindowsUpdate
Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot
Get-AppxPackage | Update-InboxApp
```

Sysprep shortcut
```
C:\Windows\System32\Sysprep\sysprep.exe /generalize /shutdown /oobe /unattend:"C:\Windows\System32\Sysprep\Autounattend.xml"
```