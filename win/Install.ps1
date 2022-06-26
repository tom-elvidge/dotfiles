#Requires -RunAsAdministrator
#Requires -Version 7

# stop if not admin
if (-not [Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544') {
    throw "Must run from an Administrator shell"
}

# stop if not powershell core 7
if (-not $PSVersionTable.PSVersion.major -eq 7) {
    throw "Must run from a PowerShell 7 shell"
}

$ErrorActionPreference = "Stop"

# todo: install fonts

# install chocolatey (script will skip itself if already installed)
Set-ExecutionPolicy Bypass -Scope Proces
Invoke-Expression ".\Install-Chocolatey.ps1"

# install chocolatey packages
choco install "packages.config" -y
refreshenv

# integrate openssh with powershell
# see: https://github.com/ukbendavies/secure-dev-workflow/blob/master/pwsh/readme.md

# enable powershell gallery
powershell.exe -NoLogo -NoProfile -Command '[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Install-Module -Name PackageManagement -Force -MinimumVersion 1.4.6 -Scope CurrentUser -AllowClobber -Repository PSGallery'

# install powershell modules
Install-Module posh-git -RequiredVersion 0.7.3
Install-Module oh-my-posh -RequiredVersion 2.0.492
Install-Module PSReadLine -RequiredVersion 2.2.2

# enable windows openssh
Add-WindowsCapability -Online -Name OpenSSH.Client
Get-Service -Name ssh-agent | Set-Service -StartupType AutomaticDelayedStart

# copy dotfiles to required locations

# powershell profile
Copy-Item Microsoft.PowerShell_profile.ps1 $PROFILE

# oh-my-posh config
$OmpConfigFileName = "myrobbyrussel.omp.json"
Copy-Item $OmpConfigFileName $ENV:USERPROFILE\\Documents\\WindowsPowerShell\\$OmpConfigFileName

# todo: windows terminal settings
# $WtDir = Get-ChildItem $ENV:LOCALAPPDATA\\Packages | Select-String WindowsTerminal
# Copy-Item settings.json $ENV:LOCALAPPDATA\\Packages\\$WtDir\\LocalState\\settings.json
