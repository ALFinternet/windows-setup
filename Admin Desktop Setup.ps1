# Setup my admin desktop computer
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force -AllowClobber

# Install RSAT Tools
Add-WindowsCapability -Online -Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.CertificateServices.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.DHCP.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.Dns.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.ServerManager.Tools~~~~0.0.1.0"


# Install M365 Powershells
Install-Module -Name MSOnline -Force
Install-Module -Name AzureAD -Force
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Force
Install-Module -Name MicrosoftTeams -Force -AllowClobber
Install-Module -Name ExchangeOnlineManagement -Force
