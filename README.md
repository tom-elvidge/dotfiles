# dotfiles

Collection of files to set up my base development environment (e.g. a shell, Visual Studio Code, kubectl, platform CLIs, etc). Additional configuration required on a per project basis.

## Windows

Install PowerShell Core 7 with the instructions [here](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows). My preference is to do this outside of Chocolatey otherwise it can be easy to accidentally upgrade PowerShell from a PowerShell prompt which can create issues.

Run the install script from a Administrator PowerShell 7 shell.

```PowerShell
.\win\Install.ps1
```

Add font to Windows Terminal settings manually.

```json
{
    "$help": "https://aka.ms/terminal-documentation",
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "profiles": 
    {
        "defaults": 
        {
            "font": 
            {
                "face": "DroidSansMono NF",
                "size": 11
            }
        },
        ...
    },
    ...
}
```

Create new or add existing ssh keys to `.ssh`, see [instructions for configuring ssh keys with GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

Add all keys in `.ssh` to the ssh-agent. Thanks to OpenSSH this will be the only time are prompted for the passphrases.

```PowerShell
ssh-add
```

Configure email and username for git.

```PowerShell
git config --global user.email "email here"
git config --global user.name "tom-elvidge"
```

todo

- Install fonts in `Install.ps1` see [here](https://blog.simontimms.com/2021/06/11/installing-fonts/)
- Visual Studio Code settings
- Windows Terminal settings
- `Install.ps1` should run in isolation and clone the repo to get required files
- `Install.ps1` should create symlinks to locally cloned repo rather than copying

## Linux

todo

## macOS

todo

## Codespaces

Codespaces will clone dotfiles and execute an install script, see more [here](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account). This install script should call into my Linux dotfiles install script.