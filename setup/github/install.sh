#!/bin/bash
# =============================================================================
# install.sh — Full GitHub Standards Installer
#
# Runs all GitHub setup scripts in sequence:
#   1. githooks.sh          → Installs Git hooks (commit-msg, pre-push)
#   2. setup-workflows.sh   → Installs GitHub Actions workflows
#   3. setup-pr-template.sh → Installs GitHub PR template
#
# Usage (from inside any project repo):
#   curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/install.sh | bash
# =============================================================================

set -e

RAW_BASE="https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github"

# ─── Colour helpers ───────────────────────────────────────────────────────────
GREEN="\033[0;32m"
RED="\033[0;31m"
CYAN="\033[0;36m"
BOLD="\033[1m"
RESET="\033[0m"

info()    { echo -e "${CYAN}$1${RESET}"; }
success() { echo -e "${GREEN}$1${RESET}"; }
error()   { echo -e "${RED}$1${RESET}"; exit 1; }

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║        🚀  Engineering Standards — Full Setup                ║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""

# ─── Must be run from inside a Git repo ──────────────────────────────────────
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  error "❌ Not inside a Git repository. Please run this from your project root."
fi

# ─── Step 1: Git Hooks ────────────────────────────────────────────────────────
echo -e "${BOLD}[1/3] Installing Git hooks...${RESET}"
bash <(curl -fsSL "$RAW_BASE/githooks.sh")

# ─── Step 2: GitHub Actions Workflows ────────────────────────────────────────
echo -e "${BOLD}[2/3] Installing GitHub Actions workflows...${RESET}"
bash <(curl -fsSL "$RAW_BASE/setup-workflows.sh")

# ─── Step 3: PR Template ─────────────────────────────────────────────────────
echo -e "${BOLD}[3/3] Installing PR template...${RESET}"
bash <(curl -fsSL "$RAW_BASE/setup-pr-template.sh")

# ─── Done ─────────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║        ✅  All Engineering Standards Installed!              ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo "  Installed:"
echo "    ✅ Git hooks         → .githooks/ (commit-msg, pre-push)"
echo "    ✅ GitHub workflows  → .github/workflows/ (branch + commit validation)"
echo "    ✅ PR template       → .github/pull_request_template.md"
echo ""
echo "  Next steps:"
echo "    1. Commit .github/ to activate GitHub Actions and PR template"
echo "    2. Share this one-liner with your team:"
echo ""
echo "       curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/install.sh | bash"
echo ""
