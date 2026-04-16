#!/bin/bash
set -euo pipefail

# ── Logging helpers ───────────────────────────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

log_info()  { echo -e "\n${GREEN}${BOLD}INFO${RESET}: $*"; }
log_warn()  { echo -e "${YELLOW}${BOLD}WARNING${RESET}: $*"; }
log_error() { echo -e "${RED}${BOLD}ERROR${RESET}: $*" >&2; }
log_step()  { echo -e "\n${CYAN}${BOLD}==> $*${RESET}"; }

# ── Install Rust ──────────────────────────────────────────────────────────────
log_step "Installing Rust via rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
source "$HOME/.cargo/env"

# ── Configure Rust toolchain ──────────────────────────────────────────────────
log_step "Configuring Rust toolchain..."
rustup default stable
rustup component add rust-analyzer
rustup update

log_info "Rust installation and configuration complete."
