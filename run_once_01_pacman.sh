#!/bin/bash
set -euo pipefail

# Configure pacman
sed -i 's/^#Color$/Color/; /^Color$/a ILoveCandy' /etc/pacman.conf

# Install pacman-managed packages
pacman -Syyu --noconfirm
pacman -S --noconfirm --needed base-devel npm nodejs git github-cli openssh wget less unzip
pacman -S --noconfirm --needed vim neovim fastfetch btop zsh fish starship zoxide fzf eza
