#!/bin/bash
set -euo pipefail

# ── Logging helpers ───────────────────────────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

log_info()  { echo -e "\n${GREEN}${BOLD}INFO${RESET}: $*"; }
log_warn()  { echo -e "${YELLOW}${BOLD}WARNING${RESET}: $*"; }
log_error() { echo -e "${RED}${BOLD}ERROR${RESET}: $*" >&2; }
log_step()  { echo -e "\n${CYAN}${BOLD}==> $*${RESET}"; }

# ── Generate SSH key ──────────────────────────────────────────────────────────
log_step "Generating SSH key..."
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_asmp -N ""

# ── Clone nvim config ─────────────────────────────────────────────────────────
log_step "Cloning nvim config..."
if [ -d "$HOME/.config/nvim" ]; then
    log_info "~/.config/nvim already exists, skipping clone."
else
    git clone https://github.com/Smileyhojin/nvim_config.git "$HOME/.config/nvim"
fi

# ── Finalization notice ───────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${GREEN}==================================================================${RESET}"
echo -e "${BOLD}${GREEN}   Installation complete! Run these commands to finalize setup:   ${RESET}"
echo -e "${BOLD}${GREEN}==================================================================${RESET}"
echo ""
echo -e "${BOLD}0. Remark on the default shell${RESET}"
echo -e "   The default shell is now set to fish."
echo -e "   You can apply the change by either logging out and back in, or running: ${YELLOW}exec fish${RESET}."
echo -e "   For a POSIX-compliant experience, use ${YELLOW}zsh${RESET}."
echo ""
echo -e "${BOLD}1. Set your git identity:${RESET}"
echo -e "   ${YELLOW}git config --global user.email \"you@example.com\"${RESET}"
echo -e "   ${YELLOW}git config --global user.name  \"Your Name\"${RESET}"
echo ""
echo -e "${BOLD}2. Authenticate the GitHub CLI:${RESET}"
echo -e "   ${YELLOW}gh auth login${RESET}"
echo ""
echo -e "${BOLD}3. Paste kellnr token at:${RESET}"
echo -e "   ${YELLOW}~/.cargo/config.toml${RESET}"
echo ""
echo -e "${BOLD}Then your House is good to go!${RESET}"
echo ""
