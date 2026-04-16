# dotfiles_asmp

Dotfiles for the 'House', suited for IE team of Asteromorph.

Assumes a clean Arch Linux as a starting point.

## What is Included

### Packages — via `pacman`

- Build/Dev: `base-devel` `npm` `nodejs` `git` `github-cli` `openssh` `wget` `less` `unzip`
- Editors: `vim` `neovim`
- Shell & Prompt: `fish` `zsh` `starship` `zoxide` `fzf` `eza`
- TUI / Multiplexer: `btop` `fastfetch` `tmux` `zellij`

### Rust — via `rustup`

- `stable` toolchain used and set as default
- `rust-analyzer` LSP installed

### Configs to Note

- `~/.bashrc`: `bash` immediately hands off to fish. Use `zsh` if you need a POSIX-compliant experience.
- `~/.config/fish/`: Initialises starship, zoxide, eza icons and aliases. Sets nvim as the default editor.
- `~/.config/nvim/`: Neovim configuration files — [cloned](https://github.com/Smileyhojin/LazyVim_config) on first apply
- `~/.cargo/config.toml`: kellnr private registry, token required
- `~/.ssh/`: ed25519 SSH key generated on first apply, configured for GitHub

## How to Use

Use the following one-liner to install chezmoi and apply the dotfiles:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Smileyhojin/dotfiles_asmp
```

After kellnr token & git/github configuration, the 'House' is ready to use.

---

## Modifying the Dotfiles

You can use `chezmoi re-add filename` or `chezmoi apply`, whatever method you want...

Note: when pushing after some commits, you should at least once configure the remote url to the correct one.

```sh
git remote set-url origin git@github.com:Smileyhojin/dotfiles_asmp.git
```
