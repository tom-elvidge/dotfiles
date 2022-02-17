# dotfiles

Collection of files to set up my base development environment. Additional configuration required on a per project basis.

## Windows

Install DroidSansMono nerd font manually.

Install Chocolatey manually.

Execute the `Setup.ps1` which installs Chocolatey packages and moves configuration files to their expected locations.

```PowerShell
.\Setup.ps1
```

Configuration files installed by `Setup.ps1`.

- `myrobbyrussel.omp.json` Oh My Posh configuration
- `settings.json` Windows Terminal settings
- `WindowsTerminalPowerShell.ps1` Custom PowerShell profile which is only executed from Windows Terminal

Create an ssh key for GitHub.

```PowerShell
ssh-keygen -t ed25519-sk -C "email here"
ssh-add
```

[Add the public key to GithHub settings.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

Add git email and name. Make sure git is using OpenSSH so ssh key passphrases are saved.

```PowerShell
git config --global user.email "email here"
git config --global user.name "GitHub username here"
git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe
```
