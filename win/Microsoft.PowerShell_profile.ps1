# enable posh-git and use Windows OpenSSH Agent
Import-Module posh-git
$env:GIT_SSH = $((Get-Command -Name ssh).Source)

# tab complete for kubectl
kubectl completion powershell | Out-String | Invoke-Expression

# tab complete for choco
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# use custom oh-my-posh theme
oh-my-posh --init --shell pwsh --config $ENV:USERPROFILE\\Documents\\WindowsPowerShell\\myrobbyrussel.omp.json | Invoke-Expression