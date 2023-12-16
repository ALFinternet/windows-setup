# Setup my admin desktop computer
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force -AllowClobber

# Install RSAT Tools
Add-WindowsCapability -Online -Name "Rsat.ServerManager.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.CertificateServices.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.DHCP.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.Dns.Tools~~~~0.0.1.0"
Add-WindowsCapability -Online -Name "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0"

# Enable WinRM - https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps#turn-on-basic-authentication-in-winrm
#winrm set winrm/config/client/auth '@{Basic="true"}'
winrm quickconfig -force

# Install M365 Powershells
Install-Module -Name MSOnline -Force
Install-Module -Name AzureAD -Force
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Force
Install-Module -Name MicrosoftTeams -Force -AllowClobber
Install-Module -Name ExchangeOnlineManagement -Force

# https://chocolatey.org/install
# choco feature enable -n allowGlobalConfirmation

# 7-Zip
choco install 7zip
# Bitwarden
choco install bitwarden
# ImgBurn
choco install imgburn
# MicroSIP
choco install microsip
# mRemoteNG / MobaXterm
choco install mremoteng
# Notepad++
choco install notepadplusplus
# OpenVPN Client
choco install openvpn-connect
# ShareX
choco install sharex
# VLC Player
choco install vlc
# VMware OVA plugin
# VMware Remote Console
choco install vmrc
# WinSCP
choco install winscp
# Wireguard Client
choco install wireguard
