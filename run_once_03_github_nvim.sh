#!/bin/bash
set -euo pipefail

# Set git user
git config --global user.email "ic434hojin@gmail.com"
git config --global user.name "Smileyhojin"

# ssh-keygen
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_asmp_hjyoo -N ""

# Configure nvim
chezmoi apply --include=externals --refresh-externals
