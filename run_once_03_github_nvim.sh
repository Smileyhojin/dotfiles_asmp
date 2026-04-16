#!/bin/bash
set -euo pipefail

# Set git user
git config --global user.email "ic434hojin@gmail.com"
git config --global user.name "Smileyhojin"

# ssh-keygen
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_asmp_hjyoo -N ""

# configure nvim
if [ -d "$HOME/.config/nvim" ]; then
    echo "~/.config/nvim already exists, skipping clone"
else
    git clone https://github.com/Smileyhojin/LazyVim_config.git "$HOME/.config/nvim"
fi
