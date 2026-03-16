#!/bin/bash
# =============================================================================
# install.sh — RCA Template Installer
#
# Downloads RCA_Template.md into a templates/ folder in the project root.
#
# Usage (from inside any project repo):
#   curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/rca/install.sh | bash
# =============================================================================

set -e

RAW_BASE="https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/rca"

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
echo -e "${CYAN}║           📄  RCA Template Installer                         ║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""

# ─── Must be run from inside a Git repo ──────────────────────────────────────
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  error "❌ Not inside a Git repository. Please run this from your project root."
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
TEMPLATES_DIR="$REPO_ROOT/templates"

info "  Project root     : $REPO_ROOT"
info "  Templates target : $TEMPLATES_DIR"
echo ""

# ─── Create templates/ if it doesn't exist ───────────────────────────────────
mkdir -p "$TEMPLATES_DIR"
success "  ✅ Directory ready: templates/"

# ─── Download RCA template ────────────────────────────────────────────────────
info "  📥 Downloading RCA_Template.md..."
curl -fsSL "$RAW_BASE/RCA_Template.md" -o "$TEMPLATES_DIR/RCA_Template.md"
success "  ✅ Installed: templates/RCA_Template.md"

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║        ✅  RCA Template Installed Successfully!              ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo "  Usage:"
echo "    Copy templates/RCA_Template.md when starting a postmortem."
echo "    Fill in all {{PLACEHOLDER}} fields with incident details."
echo ""
echo "  To update to the latest template version, re-run:"
echo "    curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/rca/install.sh | bash"
echo ""
