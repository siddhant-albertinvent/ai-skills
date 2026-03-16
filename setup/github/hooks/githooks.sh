#!/bin/bash
# =============================================================================
# githooks.sh — Git Hooks Installer
#
# Downloads commit-msg and pre-push hooks into .githooks/ and sets core.hooksPath.
#
# Usage (from inside any project repo):
#   curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/hooks/githooks.sh | bash
# =============================================================================

set -e

RAW_BASE="https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/hooks"

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
echo -e "${CYAN}║              🔧  Git Hooks Installer                         ║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""

# ─── Must be run from inside a Git repo ──────────────────────────────────────
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  error "❌ Not inside a Git repository. Please run this from your project root."
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
HOOKS_DIR="$REPO_ROOT/.githooks"

info "  Project root : $REPO_ROOT"
info "  Hooks target : $HOOKS_DIR"
echo ""

# ─── Create .githooks/ ───────────────────────────────────────────────────────
mkdir -p "$HOOKS_DIR"
success "  ✅ Directory ready: .githooks/"

# ─── Download hook files ──────────────────────────────────────────────────────
HOOKS=("commit-msg" "pre-push")

for hook in "${HOOKS[@]}"; do
  info "  📥 Downloading $hook..."
  curl -fsSL "$RAW_BASE/$hook" -o "$HOOKS_DIR/$hook"
  chmod +x "$HOOKS_DIR/$hook"
  success "  ✅ Installed: .githooks/$hook"
done

# ─── Point Git to the hooks directory ────────────────────────────────────────
git -C "$REPO_ROOT" config core.hooksPath ".githooks"
success "  ✅ Git hooksPath set to: .githooks"

echo ""
echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║        ✅  Git Hooks Installed Successfully!                 ║${RESET}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo "  Active hooks:"
echo "    • commit-msg  → Requires Linear ticket ID + [skip ci] in all commits"
echo "    • pre-push    → Enforces branch naming (feat|bug|hotfix/<id>-<desc>)"
echo ""
echo "  To update hooks later, re-run:"
echo "    curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/setup/github/hooks/githooks.sh | bash"
echo ""
