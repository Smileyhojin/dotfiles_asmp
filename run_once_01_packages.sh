#!/bin/bash
set -euo pipefail
echo "DisableSandbox" >>/etc/pacman.conf

pacman -Syyu --noconfirm
pacman -S --noconfirm --needed base-devel npm nodejs git github-cli openssh wget less unzip
pacman -S --noconfirm --needed vim neovim fastfetch btop fish starship zoxide fzf eza
