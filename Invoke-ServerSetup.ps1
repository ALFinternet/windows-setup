Set-ExecutionPolicy Unrestricted

Write-Host "Downloading pre-reqs" -ForegroundColor Green
curl -o "diskpart.txt" "https://raw.githubusercontent.com/ALFinternet/windows-setup/refs/heads/main/core/diskpart.txt"
curl -o "C:\Windows\System32\Sysprep\autounattend.xml" "https://raw.githubusercontent.com/ALFinternet/windows-setup/refs/heads/main/core/autounattend_server.xml"
curl -o "C:\Windows\System32\Sysprep\sysprep.exe - Shortcut.lnk" "https://raw.githubusercontent.com/ALFinternet/windows-setup/refs/heads/main/core/sysprep.exe - Shortcut.lnk"

diskpart /s diskpart.txt

Write-Host "Installing requirements" -ForegroundColor Green
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Install-Module -Name Microsoft.PowerShell.PSResourceGet -Force
Set-PSResourceRepository -Name PSGallery -Trusted
Install-Module PSWindowsUpdate -Force
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host "Installing applications via Chocolatey" -ForegroundColor Green
choco install 7zip googlechrome -y --force

Write-Host "Running Windows Updates" -ForegroundColor Green
Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot

$filePath = "C:\Users\Public\Desktop\VLC media player.lnk"
if (Test-Path $filePath) {
    Remove-Item -Path $filePath -Force
}

$filePath = "C:\Users\Public\Desktop\Edge Browser.lnk"
if (Test-Path $filePath) {
    Remove-Item -Path $filePath -Force
}

# shutdown /r /f /t 10