Set-ExecutionPolicy Unrestricted
curl -o "diskpart.txt" "https://raw.githubusercontent.com/ALFinternet/windows-setup/refs/heads/main/core/diskpart.txt"
diskpart /s diskpart.txt
Write-Host "Installing requirements" -ForegroundColor Green
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Install-Module -Name Microsoft.PowerShell.PSResourceGet -Force
Set-PSResourceRepository -Name PSGallery -Trusted
Install-Module PSWindowsUpdate -Force
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Host "Installing applications via Chocolatey" -ForegroundColor Green
choco install 7zip googlechrome vlc -y --force
Write-Host "Running Windows Updates" -ForegroundColor Green
#Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot

#$filePath = "C:\Users\Admin\diskpart.txt"
#if (Test-Path $filePath) {
    #Remove-Item -Path $filePath -Force
#}
#shutdown /r /f /t 10