Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.201 -Force;Install-Module PSWindowsUpdate -Force; Import-Module PSWindowsUpdate; Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot;Remove-Module -Name "PSWindowsUpdate"