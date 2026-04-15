# dotfiles_asmp

Dotfiles for the 'House', suited for IE team of Asteromorph.

Assumes a clean Arch Linux as a starting point.

## How to Use

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Smileyhojin/dotfiles_asmp
```

After running `gh auth login` and configuring the kellnr token, the house is ready to use.

## Modifying the Dotfiles

Use `chezmoi re-add filename` or `chezmoi apply`, whatever method you want...

Note: when pushing after some commits, you should at least once configure the remote url to the correct one.

```sh
git remote set-url origin git@github.com:Smileyhojin/dotfiles_asmp.git
```
