#!/bin/bash
# =============================================================================
# install.sh — Git Hooks Installer
#
# Lives in your separate hooks repository.
# Developers run this via a single curl command from inside any project repo:
#
#   curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/install.sh | bash
#
# What it does:
#   1. Clones the hooks repo into .githooks/ inside the current project
#   2. Points Git to that folder via core.hooksPath
#   3. Makes all hooks executable
#   4. If already installed, pulls latest changes instead
# =============================================================================

set -e

HOOKS_REPO="https://github.com/siddhant-albertinvent/ai-skills.git"
HOOKS_DIR=".githooks"

# ─── Colour helpers ───────────────────────────────────────────────────────────
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
RESET="\033[0m"

info()    { echo -e "${CYAN}$1${RESET}"; }
success() { echo -e "${GREEN}$1${RESET}"; }
warn()    { echo -e "${YELLOW}$1${RESET}"; }
error()   { echo -e "${RED}$1${RESET}"; exit 1; }

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║           🔧  Git Hooks Installer                           ║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${RESET}"
echo ""

# ─── Must be run from inside a Git repo ──────────────────────────────────────
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  error "❌ Not inside a Git repository. Please run this from your project root."
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
HOOKS_PATH="$REPO_ROOT/$HOOKS_DIR"

info "  Project root: $REPO_ROOT"
info "  Hooks target: $HOOKS_PATH"
echo ""

# ─── Clone or update the hooks repo ──────────────────────────────────────────
if [ -d "$HOOKS_PATH/.git" ]; then
  warn "  ↻  Hooks already installed. Pulling latest..."
  git -C "$HOOKS_PATH" pull --quiet
  success "  ✅ Hooks updated to latest."
else
  info "  📥 Cloning hooks repository..."
  git clone --quiet "$HOOKS_REPO" "$HOOKS_PATH"
  success "  ✅ Hooks repository cloned."
fi

# ─── Point Git to the hooks directory ────────────────────────────────────────
git -C "$REPO_ROOT" config core.hooksPath "$HOOKS_DIR"
success "  ✅ Git hooksPath set to: $HOOKS_DIR"

# ─── Make all hooks executable ───────────────────────────────────────────────
for hook in "$HOOKS_PATH"/*; do
  if [ -f "$hook" ] && [ "$(basename "$hook")" != "install.sh" ]; then
    chmod +x "$hook"
    success "  ✅ Made executable: $(basename "$hook")"
  fi
done

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
echo "    curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/install.sh | bash"
echo ""
