#!/bin/bash
# =============================================================================
# setup-hooks.sh
# Convenience wrapper — fetches and runs the Git hooks installer from the
# central hooks repository.
#
# Usage (from your project root):
#   chmod +x setup-hooks.sh
#   ./setup-hooks.sh
#
# Or run directly without cloning anything:
#   curl -fsSL https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/install.sh | bash
# =============================================================================

INSTALL_URL="https://raw.githubusercontent.com/siddhant-albertinvent/ai-skills/main/install.sh"

if ! command -v curl &> /dev/null; then
  echo "❌ curl is required but not installed. Please install curl and try again."
  exit 1
fi

curl -fsSL "$INSTALL_URL" | bash
