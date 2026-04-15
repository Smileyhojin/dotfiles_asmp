#!/bin/bash
set -euo pipefail

# Install rust and related stuffs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
rustup default stable
rustup component add rust-analyzer
rustup update
cargo install zellij
