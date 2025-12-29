# Old ReadMe

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