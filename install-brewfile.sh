#!/bin/bash
# Safe installation script for Brewfile
# This script ensures PATH is set correctly before installing
# It's idempotent - safe to run multiple times
# Handles sudo password requirements for packages like docker-desktop

# Don't exit on error immediately - we'll handle errors gracefully
set +e

# Set PATH first to ensure all commands are available
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Source Homebrew environment if available
if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    BREW_PATH="/opt/homebrew/bin/brew"
elif [ -f /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
    BREW_PATH="/usr/local/bin/brew"
else
    echo "Error: Homebrew not found. Please install Homebrew first."
    echo "Visit: https://brew.sh"
    exit 1
fi

# Verify brew is working
if ! "$BREW_PATH" --version >/dev/null 2>&1; then
    echo "Error: brew command not working"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="${SCRIPT_DIR}/Brewfile"

# Check if Brewfile exists
if [ ! -f "$BREWFILE" ]; then
    echo "Error: Brewfile not found at $BREWFILE"
    exit 1
fi

echo "=========================================="
echo "Installing packages from Brewfile"
echo "=========================================="
echo "Brewfile location: $BREWFILE"
echo "Homebrew path: $BREW_PATH"
echo ""

# Check if any packages in Brewfile might need sudo (like docker-desktop)
# Pre-authenticate with sudo to cache the password
if grep -q "docker-desktop\|docker" "$BREWFILE" 2>/dev/null; then
    if [ -t 0 ]; then
        # Only prompt if running in interactive terminal
        echo "⚠️  Some packages (like docker-desktop) require administrator privileges."
        echo "   You will be prompted for your password to allow installation."
        echo "   Your password will be cached for 5 minutes."
        echo ""
        # Cache sudo password - this will prompt if needed and cache it for 5 minutes
        # This allows brew to use sudo without repeated prompts during installation
        if ! sudo -v; then
            echo "Error: Failed to authenticate with sudo. Installation may fail for some packages."
            echo "Please run this script again and enter your password when prompted."
            echo ""
        else
            echo "✅ Sudo authentication successful. Proceeding with installation..."
            echo ""
        fi
    else
        echo "Warning: Running in non-interactive mode."
        echo "Packages requiring sudo (like docker-desktop) may fail."
        echo "Run this script interactively for best results."
        echo ""
    fi
fi

# Install from Brewfile
# Using --no-upgrade to make it idempotent
# It will skip already installed packages and won't upgrade existing ones
INSTALL_RESULT=0
"$BREW_PATH" bundle install --file "$BREWFILE" --no-upgrade || INSTALL_RESULT=$?

if [ $INSTALL_RESULT -ne 0 ]; then
    echo ""
    echo "=========================================="
    echo "Installation completed with some errors"
    echo "=========================================="
    echo ""
    echo "Some packages may have failed to install. Common issues:"
    echo "  - docker-desktop: May require manual intervention"
    echo ""
    echo "To retry failed installations:"
    echo "  $BREW_PATH bundle install --file \"$BREWFILE\""
    echo ""
    echo "Or install specific packages manually:"
    echo "  $BREW_PATH install --cask <package-name>"
    echo ""
    # Don't exit with error - some packages may have installed successfully
    set -e  # Re-enable exit on error for the rest
    exit 0
fi

# Re-enable exit on error
set -e

echo ""
echo "=========================================="
echo "Installation complete!"
echo "=========================================="
echo ""
echo "Installed packages:"
"$BREW_PATH" list --formula | grep -E "(zsh|fzf|ripgrep|fd|eza|bat|jq|httpie|ngrok|direnv|delta|volta|pnpm|git|gh|tree|btop|tmux|starship|powerlevel10k|libpq|pgcli)" || echo "  (Some packages may have different names)"
echo ""
echo "To see all installed packages: $BREW_PATH list"
echo ""
echo "=========================================="
echo "Next Steps: Configure Terminal Autocompletion"
echo "=========================================="
echo ""
echo "🚀 For enhanced terminal autocompletion (fuzzy tab completion, suggestions):"
echo "   bash configure-zsh-autocomplete.sh"
echo ""
echo "   This will set up:"
echo "   - fzf-tab (fuzzy searchable tab completions)"
echo "   - zsh-autosuggestions (command suggestions)"
echo "   - zsh-completions (enhanced completions)"
echo "   - fast-syntax-highlighting (syntax colors)"
echo ""
echo "🎨 For beautiful git diffs:"
echo "   bash configure-delta.sh"
echo ""

