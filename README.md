# windows-setup
Various Windows Setup Scripts/Files

Auto phase:
```Powershell
curl -o "diskpart.txt" "https://raw.githubusercontent.com/ALFinternet/windows-setup/refs/heads/main/core/diskpart.txt"
diskpart /s diskpart.txt
Set-ExecutionPolicy Unrestricted
Write-Host "Installing requirements" -ForegroundColor Green
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Install-Module PSWindowsUpdate -Force
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Host "Installing applications via Chocolatey" -ForegroundColor Green
choco install 7zip googlechrome vlc -y --force
Write-Host "Running Windows Updates" -ForegroundColor Green
Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot

$filePath = "C:\Users\Admin\diskpart.txt"
if (Test-Path $filePath) {
    Remove-Item -Path $filePath -Force
}
shutdown /r /f /t 10
```


Sysprep shortcut
```
C:\Windows\System32\Sysprep\sysprep.exe /generalize /shutdown /oobe /unattend:"C:\Windows\System32\Sysprep\Autounattend.xml"
```

Office C2R Updater:
```
"C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user
```


[Win11 Pro Sysprep Generator - AUDIT MODE](https://schneegans.de/windows/unattend-generator/?LanguageMode=Unattended&UILanguage=en-US&Locale=en-US&Keyboard=00000409&GeoLocation=244&ProcessorArchitecture=amd64&ComputerNameMode=Random&CompactOsMode=Never&TimeZoneMode=Explicit&TimeZone=Pacific+Standard+Time&PartitionMode=Unattended&PartitionLayout=GPT&EspSize=300&RecoveryMode=None&DiskAssertionMode=Skip&WindowsEditionMode=Generic&WindowsEdition=pro&InstallFromMode=Automatic&PEMode=Default&UserAccountMode=Unattended&AccountName0=Admin&AccountDisplayName0=&AccountPassword0=password&AccountGroup0=Administrators&AutoLogonMode=Own&PasswordExpirationMode=Unlimited&LockoutMode=Default&HideFiles=HiddenSystem&ShowFileExtensions=true&LaunchToThisPC=true&TaskbarSearch=Hide&TaskbarIconsMode=Custom&TaskbarIconsXml=%3CLayoutModificationTemplate+xmlns%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FLayoutModification%22+xmlns%3Adefaultlayout%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FFullDefaultLayout%22+xmlns%3Astart%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FStartLayout%22+xmlns%3Ataskbar%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FTaskbarLayout%22+Version%3D%221%22%3E%0D%0A++%3CCustomTaskbarLayoutCollection+PinListPlacement%3D%22Replace%22%3E%0D%0A++++%3Cdefaultlayout%3ATaskbarLayout%3E%0D%0A++++++%3Ctaskbar%3ATaskbarPinList%3E%0D%0A++++++++%3Ctaskbar%3ADesktopApp+DesktopApplicationID%3D%22Microsoft.Windows.Explorer%22+%2F%3E%0D%0A++++++++%3Ctaskbar%3ADesktopApp+DesktopApplicationLinkPath%3D%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CGoogle+Chrome.lnk%22+%2F%3E%0D%0A++++++%3C%2Ftaskbar%3ATaskbarPinList%3E%0D%0A++++%3C%2Fdefaultlayout%3ATaskbarLayout%3E%0D%0A++%3C%2FCustomTaskbarLayoutCollection%3E%0D%0A%3C%2FLayoutModificationTemplate%3E&DisableWidgets=true&DisableBingResults=true&StartTilesMode=Default&StartPinsMode=Custom&StartPinsJson=%7B%0D%0A+++%22pinnedList%22%3A%5B%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CGoogle+Chrome.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CMicrosoft+Edge.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25APPDATA%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CFile+Explorer.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5COutlook+%28classic%29.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CExcel.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CWord.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.WindowsCalculator_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.WindowsAlarms_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.WindowsNotepad_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22windows.immersivecontrolpanel_cw5n1h2txyewy%21microsoft.windows.immersivecontrolpanel%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.ScreenSketch_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%0D%0A+++%5D%0D%0A%7D&DisableUac=true&DisableFastStartup=true&EnableLongPaths=true&EnableRemoteDesktop=true&DeleteJunctions=true&AllowPowerShellScripts=true&DisableAppSuggestions=true&HideEdgeFre=true&DisableEdgeStartupBoost=true&DeleteWindowsOld=true&DisableAutomaticRestartSignOn=true&EffectsMode=Default&DeleteEdgeDesktopIcon=true&DesktopIconsMode=Custom&IconRecycleBin=true&IconThisPC=true&IconUserFiles=true&StartFoldersMode=Custom&StartFolderDocuments=true&StartFolderDownloads=true&StartFolderFileExplorer=true&StartFolderNetwork=true&StartFolderPersonalFolder=true&StartFolderSettings=true&WifiMode=Skip&ExpressSettings=EnableAll&LockKeysMode=Configure&CapsLockInitial=Off&CapsLockBehavior=Toggle&NumLockInitial=On&NumLockBehavior=Toggle&ScrollLockInitial=Off&ScrollLockBehavior=Toggle&StickyKeysMode=Default&ColorMode=Default&WallpaperMode=Default&LockScreenMode=Default&RemoveBingSearch=true&RemoveCopilot=true&RemoveCortana=true&RemoveFamily=true&RemoveFeedbackHub=true&RemoveMailCalendar=true&RemoveMaps=true&RemoveZuneVideo=true&RemoveNews=true&RemoveOffice365=true&RemoveOneDrive=true&RemoveOneNote=true&RemoveOneSync=true&RemoveOutlook=true&RemovePeople=true&RemoveRecall=true&RemoveSkype=true&RemoveTeams=true&RemoveGetStarted=true&RemoveWallet=true&RemoveZuneMusic=true&RemoveYourPhone=true&SystemScript0=powercfg+%2FH+OFF%0D%0Apowercfg+%2Fs+8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c%0D%0Amkdir+%22C%3A%5CTemp%5C%22%0D%0Amkdir+%22C%3A%5C_Finch+Tech%5C%22&SystemScriptType0=Cmd&FirstLogonScript0=Set-ExecutionPolicy+Unrestricted&FirstLogonScriptType0=Ps1&WdacMode=Skip&AppLockerMode=Skip&ComponentContent0=%3CReseal%3E%0D%0A++++%3CMode%3EAudit%3C%2FMode%3E%0D%0A%3C%2FReseal%3E&Component0=Microsoft-Windows-Deployment-oobeSystem)

[Win11 Pro Sysprep Generator - FINAL MODE](https://schneegans.de/windows/unattend-generator/?LanguageMode=Unattended&UILanguage=en-US&Locale=en-US&Keyboard=00000409&GeoLocation=244&ProcessorArchitecture=amd64&ComputerNameMode=Random&CompactOsMode=Never&TimeZoneMode=Explicit&TimeZone=Pacific+Standard+Time&PartitionMode=Unattended&PartitionLayout=GPT&EspSize=300&RecoveryMode=None&DiskAssertionMode=Skip&WindowsEditionMode=Generic&WindowsEdition=pro&InstallFromMode=Automatic&PEMode=Default&UserAccountMode=Unattended&AccountName0=Admin&AccountDisplayName0=&AccountPassword0=password&AccountGroup0=Administrators&AutoLogonMode=Own&PasswordExpirationMode=Unlimited&LockoutMode=Default&HideFiles=HiddenSystem&ShowFileExtensions=true&LaunchToThisPC=true&TaskbarSearch=Hide&TaskbarIconsMode=Custom&TaskbarIconsXml=%3CLayoutModificationTemplate+xmlns%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FLayoutModification%22+xmlns%3Adefaultlayout%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FFullDefaultLayout%22+xmlns%3Astart%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FStartLayout%22+xmlns%3Ataskbar%3D%22http%3A%2F%2Fschemas.microsoft.com%2FStart%2F2014%2FTaskbarLayout%22+Version%3D%221%22%3E%0D%0A++%3CCustomTaskbarLayoutCollection+PinListPlacement%3D%22Replace%22%3E%0D%0A++++%3Cdefaultlayout%3ATaskbarLayout%3E%0D%0A++++++%3Ctaskbar%3ATaskbarPinList%3E%0D%0A++++++++%3Ctaskbar%3ADesktopApp+DesktopApplicationID%3D%22Microsoft.Windows.Explorer%22+%2F%3E%0D%0A++++++++%3Ctaskbar%3ADesktopApp+DesktopApplicationLinkPath%3D%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CGoogle+Chrome.lnk%22+%2F%3E%0D%0A++++++%3C%2Ftaskbar%3ATaskbarPinList%3E%0D%0A++++%3C%2Fdefaultlayout%3ATaskbarLayout%3E%0D%0A++%3C%2FCustomTaskbarLayoutCollection%3E%0D%0A%3C%2FLayoutModificationTemplate%3E&DisableWidgets=true&DisableBingResults=true&StartTilesMode=Default&StartPinsMode=Custom&StartPinsJson=%7B%0D%0A+++%22pinnedList%22%3A%5B%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CGoogle+Chrome.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CMicrosoft+Edge.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25APPDATA%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CFile+Explorer.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5COutlook+%28classic%29.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CExcel.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22desktopAppLink%22%3A%22%25ALLUSERSPROFILE%25%5C%5CMicrosoft%5C%5CWindows%5C%5CStart+Menu%5C%5CPrograms%5C%5CWord.lnk%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.WindowsCalculator_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.WindowsAlarms_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.WindowsNotepad_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22windows.immersivecontrolpanel_cw5n1h2txyewy%21microsoft.windows.immersivecontrolpanel%22%0D%0A++++++%7D%2C%0D%0A++++++%7B%0D%0A+++++++++%22packagedAppId%22%3A%22Microsoft.ScreenSketch_8wekyb3d8bbwe%21App%22%0D%0A++++++%7D%0D%0A+++%5D%0D%0A%7D&DisableUac=true&DisableFastStartup=true&EnableLongPaths=true&EnableRemoteDesktop=true&DeleteJunctions=true&AllowPowerShellScripts=true&DisableAppSuggestions=true&HideEdgeFre=true&DisableEdgeStartupBoost=true&DeleteWindowsOld=true&DisableAutomaticRestartSignOn=true&EffectsMode=Default&DeleteEdgeDesktopIcon=true&DesktopIconsMode=Custom&IconRecycleBin=true&IconThisPC=true&IconUserFiles=true&StartFoldersMode=Custom&StartFolderDocuments=true&StartFolderDownloads=true&StartFolderFileExplorer=true&StartFolderNetwork=true&StartFolderPersonalFolder=true&StartFolderSettings=true&WifiMode=Skip&ExpressSettings=EnableAll&LockKeysMode=Configure&CapsLockInitial=Off&CapsLockBehavior=Toggle&NumLockInitial=On&NumLockBehavior=Toggle&ScrollLockInitial=Off&ScrollLockBehavior=Toggle&StickyKeysMode=Default&ColorMode=Default&WallpaperMode=Default&LockScreenMode=Default&RemoveBingSearch=true&RemoveCopilot=true&RemoveCortana=true&RemoveFamily=true&RemoveFeedbackHub=true&RemoveMailCalendar=true&RemoveMaps=true&RemoveZuneVideo=true&RemoveNews=true&RemoveOffice365=true&RemoveOneNote=true&RemoveOneSync=true&RemoveOutlook=true&RemovePeople=true&RemoveRecall=true&RemoveSkype=true&RemoveTeams=true&RemoveGetStarted=true&RemoveWallet=true&RemoveZuneMusic=true&RemoveYourPhone=true&SystemScript0=powercfg+%2FH+OFF%0D%0Apowercfg+%2Fs+8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c%0D%0Amkdir+%22C%3A%5CTemp%5C%22%0D%0Amkdir+%22C%3A%5C_Finch+Tech%5C%22&SystemScriptType0=Cmd&FirstLogonScript0=Set-ExecutionPolicy+Unrestricted&FirstLogonScriptType0=Ps1&WdacMode=Skip&AppLockerMode=Skip)


## To Do
[Dark mode](https://gist.github.com/bobby-tablez/4b5f1ee02c68a93dc8312c4ff858c0a7)



<details>
<summary>Various links to the sysprep issue I was having</summary>
https://www.reddit.com/r/sysadmin/comments/1mvs6hg/help_trying_to_sysrep_wthose_annoying_app_was/

https://www.google.com/search?q=Package+Microsoft.Winget.Source_2025.1226.645.1_neutral__8wekyb3d8bbwe+was+installed+for+a+user%2C+but+not+provisioned+for+all+users.+This+package+will+not+function+properly+in+the+sysprep&oq=Package+Microsoft.Winget.Source_2025.1226.645.1_neutral__8wekyb3d8bbwe+was+installed+for+a+user%2C+but+not+provisioned+for+all+users.+This+package+will+not+function+properly+in+the+sysprep&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBBzMyNGowajeoAgCwAgA&sourceid=chrome&ie=UTF-8&sei=fTFOaezlMqvQkPIPyJTyCA

https://www.google.com/search?q=AppxPackage+Microsoft.Winget.Source_2025.1226.645.1_neutral__8wekyb3d8bbwe&oq=AppxPackage+Microsoft.Winget.Source_2025.1226.645.1_neutral__8wekyb3d8bbwe&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBCDQ5MzBqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8

https://www.reddit.com/r/sysadmin/comments/1lfr8rr/unable_to_sysprep_due_to_unremovable_appxpackage/

https://michlstechblog.info/blog/windows-sysprep-fails-with-package-xy-installed-for-a-user-but-not-provisioned-for-all-users/
</details>


<details>

<summary>Old notes</summary>

Phase 1:
```
Set-ExecutionPolicy Unrestricted
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Install-Module PSWindowsUpdate -Force

diskpart
select disk 0
select part 4
delete part override


Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot
```

Manual Phase 2:
1. Remove recovery partition (reagentc /disable, diskpart delete part # override)
2. Expand C drive
3. Install Apps (Chrome, 7Zip, VLC Player, etc)
4. Run Disk Cleanup




Phase 1:
```
Set-ExecutionPolicy Unrestricted
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Install-Module PSWindowsUpdate -Force
Install-Script Update-InboxApp -Force
Get-AppxPackage | Update-InboxApp
## RESTART WINDOWS
```

Phase 2:
```
Get-AppxPackage | Update-InboxApp
# winget upgrade will fail, trigger Installer update
winget upgrade --all --silent --accept-package-agreements --accept-source-agreements --verbose-logs
# get Installer update
Get-AppxPackage | Update-InboxApp
winget upgrade --all --silent --accept-package-agreements --accept-source-agreements --verbose-logs
winget source add -n finchtech -t "Microsoft.Rest" -a https://winget.finchtech.com/wg/
winget install -e --id "7zip.7zip" --silent --accept-package-agreements --accept-source-agreements --verbose-logs
winget install -e --id "VideoLAN.VLC" --silent --accept-package-agreements --accept-source-agreements --verbose-logs
winget install -e --id "Google.Chrome" --silent --accept-package-agreements --accept-source-agreements --verbose-logs -s finchtech
Import-Module PSWindowsUpdate
Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot
```
</details>


<details>

<summary>Older Notes</summary>

# Old setup notes
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

</details>