#!/bin/bash
# =============================================================================
# setup-pr-template.sh — GitHub PR Template Installer
#
# Downloads pull_request_template.md into .github/ in the target project.
#
# Usage (from inside any project repo):
#   curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/setup-pr-template.sh | bash
# =============================================================================

set -e

RAW_BASE="https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/templates"

# ─── Colour helpers ───────────────────────────────────────────────────────────
GREEN="\033[0;32m"
RED="\033[0;31m"
CYAN="\033[0;36m"
RESET="\033[0m"

info()    { echo -e "${CYAN}$1${RESET}"; }
success() { echo -e "${GREEN}$1${RESET}"; }
error()   { echo -e "${RED}$1${RESET}"; exit 1; }

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║           📋  PR Template Installer                          ║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""

# ─── Must be run from inside a Git repo ──────────────────────────────────────
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  error "❌ Not inside a Git repository. Please run this from your project root."
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
GITHUB_DIR="$REPO_ROOT/.github"

info "  Project root : $REPO_ROOT"
info "  Target       : $GITHUB_DIR/pull_request_template.md"
echo ""

# ─── Create .github/ if it doesn't exist ─────────────────────────────────────
mkdir -p "$GITHUB_DIR"
success "  ✅ Directory ready: .github/"

# ─── Download PR template ─────────────────────────────────────────────────────
info "  📥 Downloading pull_request_template.md..."
curl -fsSL "$RAW_BASE/pull_request_template.md" -o "$GITHUB_DIR/pull_request_template.md"
success "  ✅ Installed: .github/pull_request_template.md"

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║        ✅  PR Template Installed Successfully!               ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo "  GitHub will automatically use this template when opening new PRs."
echo "  Commit and push .github/pull_request_template.md to activate it."
echo ""
