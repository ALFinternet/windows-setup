@ECHO ON
::	Run these items after creating a new VM to perform some customizations
::	2026-01-11
::

:: https://thedxt.ca/2023/06/moving-windows-recovery-partition-correctly/
::diskpart
::select disk 0
::select part 4
::delete part override
::exit


mkdir "C:\Temp\"
::
:: reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "C:\Temp" /t REG_DWORD /d "0" /f


:: for current user
:: Show hidden files
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
:: Show file extensions
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
:: Disable 'Get Even More Out of Windows Screen' https://winaero.com/disable-get-even-more-out-of-windows-in-windows-10/
:: https://www.elevenforum.com/t/enable-or-disable-lets-finish-setting-up-your-device-in-windows-11.5205/
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d "0" /f
:: Disable start menu suggestions
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
:: Disable Windows Welcome Experience - https://www.elevenforum.com/t/enable-or-disable-windows-welcome-experience-in-windows-11.3657/
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
:: Disable Get tips and suggestions when using Windows - https://www.elevenforum.com/t/enable-or-disable-tips-and-suggestions-notifications-in-windows-11.5206/
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f

:: :: https://www.elevenforum.com/t/enable-or-disable-notification-badging-for-microsoft-accounts-on-start-menu-in-windows-11.14645/
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_AccountNotifications" /t REG_DWORD /d 0 /f
:: Numlock to on
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
:: Show This PC on desktop
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
:: Show User's folder on desktop
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
:: Privacy Speech
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
:: Turn off Tailored experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
:: Turn off relevant ads
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
:: Turn off News and Interests
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d "2" /f
:: Enable Dark Mode
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
:: Disable Widgets
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f
:: Disable Chat
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f
:: Hide Searchbar
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
:: Hide Disable BingSearch in StartMenu
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
:: Always show more options in right click
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /d "" /f


:: do default user
:: For current user profile & newuser
reg load HKLM\DefUser "C:\Users\Default\NTUSER.DAT"
:: Show hidden files
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
:: Show file extensions
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
:: Disable 'Get Even More Out of Windows Screen' https://winaero.com/disable-get-even-more-out-of-windows-in-windows-10/
:: https://www.elevenforum.com/t/enable-or-disable-lets-finish-setting-up-your-device-in-windows-11.5205/
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d "0" /f
:: Disable start menu suggestions
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
:: Disable Windows Welcome Experience
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
:: Disable Get tips and suggestions when using Windows - https://www.elevenforum.com/t/enable-or-disable-tips-and-suggestions-notifications-in-windows-11.5206/
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f

:: https://www.elevenforum.com/t/enable-or-disable-notification-badging-for-microsoft-accounts-on-start-menu-in-windows-11.14645/
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_AccountNotifications" /t REG_DWORD /d 0 /f
:: Numlock to on
reg add "HKLM\DefUser\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
:: Show This PC on desktop
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
:: Show User's folder on desktop
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
:: Privacy Speech
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
:: Turn off Tailored experiences
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
:: Turn off relevant ads
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
:: Turn off News and Interests
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d "2" /f
:: Enable Dark Mode
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
:: Disable Widgets
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f
:: Disable Chat
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f
:: Hide Searchbar
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
:: Hide Disable BingSearch in StartMenu
reg add "HKLM\DefUser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
:: Always show more options in right click
reg add "HKLM\DefUser\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /d "" /f
:: unload default user
reg unload HKLM\DefUser

reg add "HKLM\SOFTWARE\Policies\Windows\Microsoft\Windows\Windows Chat" /v "ChatIcon" /t REG_DWORD /d "3" /f

:: Disable fast startup
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d "0" /f

:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d "0" /f

:: Disable backup notifications
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsBackup" /v "DisableMonitoring" /t REG_DWORD /d "1" /f

:: Disable Copilot
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f

:: Enable RDP
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d "0" /f

:: Disable Windows Admin Center popup nag - for server OSes
reg add "HKLM\SOFTWARE\Microsoft\ServerManager" /v "DoNotPopWACConsoleAtSMLaunch" /t REG_DWORD /d "1" /f

:: Disable AzureARC - for server OSes
powershell.exe -NoProfile -NonInteractive -NoLogo -ExecutionPolicy Bypass -Command "Get-WindowsFeature AzureArcSetup | Uninstall-WindowsFeature"

:: Disable Get tips and suggestions when using Windows - https://www.elevenforum.com/t/enable-or-disable-tips-and-suggestions-notifications-in-windows-11.5206/
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f


:: Disable Hibernation (not sure if needed, but doesn't hurt) & set power plan to high performance
powercfg /H OFF
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Disable the firewall for all profiles
NetSh Advfirewall set allprofiles state off

:: Rename PC
:: WMIC computersystem where caption='%COMPUTERNAME%' rename Win11ProGold

:: Create local admin user(s)
:: net user /add <user> <password>
:: net localgroup "Administrators" <user> /add
:: WMIC USERACCOUNT WHERE Name='<user>' SET PasswordExpires=FALSE

pause