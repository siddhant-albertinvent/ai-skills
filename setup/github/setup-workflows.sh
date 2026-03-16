#!/bin/bash
# =============================================================================
# setup-workflows.sh — GitHub Actions Workflows Installer
#
# Downloads branch-validation.yml and commit-validation.yml into
# .github/workflows/ in the target project.
#
# Usage (from inside any project repo):
#   curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/setup-workflows.sh | bash
# =============================================================================

set -e

RAW_BASE="https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/workflows"

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
echo -e "${CYAN}║          ⚙️   GitHub Workflows Installer                     ║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""

# ─── Must be run from inside a Git repo ──────────────────────────────────────
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  error "❌ Not inside a Git repository. Please run this from your project root."
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
WORKFLOWS_DIR="$REPO_ROOT/.github/workflows"

info "  Project root     : $REPO_ROOT"
info "  Workflows target : $WORKFLOWS_DIR"
echo ""

# ─── Create .github/workflows/ if it doesn't exist ───────────────────────────
mkdir -p "$WORKFLOWS_DIR"
success "  ✅ Directory ready: .github/workflows/"

# ─── Download workflow files ──────────────────────────────────────────────────
WORKFLOWS=(
  "branch-validation.yml"
  "commit-validation.yml"
)

for workflow in "${WORKFLOWS[@]}"; do
  info "  📥 Downloading $workflow..."
  curl -fsSL "$RAW_BASE/$workflow" -o "$WORKFLOWS_DIR/$workflow"
  success "  ✅ Installed: .github/workflows/$workflow"
done

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║        ✅  GitHub Workflows Installed Successfully!          ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo "  Installed workflows:"
echo "    • branch-validation.yml  → Validates branch names on push / PR"
echo "    • commit-validation.yml  → Validates commit messages on push / PR"
echo ""
echo "  Commit and push .github/workflows/ to activate them in GitHub Actions."
echo ""
