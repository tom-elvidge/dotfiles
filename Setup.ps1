$ChocoPackagesFileName = "packages.config"
$OmpConfigFileName = "myrobbyrussel.omp.json"
$WtPoshProfileFileName = "WindowsTerminalPowerShell.ps1"
$WtSettingsFileName = "settings.json"

choco install $ChocoPackagesFileName -y
refreshenv

Copy-Item $OmpConfigFileName $ENV:USERPROFILE\\Documents\\$OmpConfigFileName
Copy-Item $WtPoshProfileFileName $ENV:USERPROFILE\\Documents\\$WtPoshProfileFileName

$WtDir = Get-ChildItem $ENV:LOCALAPPDATA\\Packages | Select-String WindowsTerminal
Copy-Item $WtSettingsFileName $ENV:LOCALAPPDATA\\Packages\\$WtDir\\LocalState\\$WtSettingsFileName

Add-WindowsCapability -Online -Name OpenSSH.Client
Get-Service -Name ssh-agent | Set-Service -StartupType Boot