# dotfiles

A collection of files to set up my development environment on macOS.

Make here and copy them to the home directory.

```sh
sudo cp -r .[^.]* ~
```

## Karabiner

[https://karabiner-elements.pqrs.org/](https://karabiner-elements.pqrs.org/)

I use all the default macOS keyboard shortcuts and application keymaps. When I am using the internal keyboard or macOS specific keyboards everything works by default. My custom keyboard is used for both macOS and Windows, so for this device only I use mappings which resemble Windows.

To achieve this, I have configured Karabiner to only modify events for my custom keyboard. The modifications are:

- Control with horizontal arrow keys to go to the start and end of words, also with left shift to select
- Control for cut, copy, paste, select all, undo, redo, find, delete word

## Git

Generate ssh key with a passphrase and add using Keychain to keep the passphrase.

```sh
ssh-keygen -t ed25519 -C "44055953+tom-elvidge@users.noreply.github.com"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

With the current `.gitconfig` this will also be used for signing commits for GitHub.

## Homebrew

Formulae

```txt
k9s
kubernetes-cli
helm
gh
tldr
nmap
```

## Manual Configuration

Change all Jetbrains IDEs to using the 'Visual Studio (macOS)' key map.
