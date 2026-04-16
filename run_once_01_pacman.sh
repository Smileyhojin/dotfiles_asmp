#!/bin/bash
set -euo pipefail

# ── Logging helpers ───────────────────────────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

log_info()  { echo -e "${GREEN}${BOLD}INFO${RESET}: $*"; }
log_warn()  { echo -e "${YELLOW}${BOLD}WARNING${RESET}: $*"; }
log_error() { echo -e "${RED}${BOLD}ERROR${RESET}: $*" >&2; }
log_step()  { echo -e "\n${CYAN}${BOLD}==> $*${RESET}"; }

# ── Retry wrapper for pacman ──────────────────────────────────────────────────
pacman_retry() {
    local attempts=3
    local delay=10
    local i=1
    until pacman "$@"; do
        if [ "$i" -ge "$attempts" ]; then
            log_error "pacman failed after $attempts attempts. Giving up, GG"
            return 1
        fi
        log_warn "pacman failed (attempt $i/$attempts), retrying in ${delay}s..."
        sleep "$delay"
        i=$((i + 1))
    done
}

# ── Configure pacman ──────────────────────────────────────────────────────────
log_step "Configuring /etc/pacman.conf"
sed -i 's/^#Color$/Color/' /etc/pacman.conf
grep -qxF 'ILoveCandy' /etc/pacman.conf || sed -i '/^Color$/a ILoveCandy' /etc/pacman.conf

# ── System update ─────────────────────────────────────────────────────────────
log_step "Updating system packages..."
pacman_retry -Syyu --noconfirm

# ── Install packages ──────────────────────────────────────────────────────────
log_step "Installing Build/Dev tools..."
pacman_retry -S --noconfirm --needed base-devel npm nodejs git github-cli openssh wget less unzip

log_step "Installing Editors..."
pacman_retry -S --noconfirm --needed vim neovim

log_step "Installing Shell & Prompt tools..."
pacman_retry -S --noconfirm --needed fish zsh starship zoxide fzf eza

log_step "Installing TUI / Multiplexer tools..."
pacman_retry -S --noconfirm --needed btop fastfetch tmux zellij

log_info "all pacman packages installed successfully."
