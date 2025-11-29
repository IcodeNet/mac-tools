#!/bin/bash
# Configure delta as git pager
# This script sets up delta (git-delta) as the default pager for git

set -e

echo "Configuring delta as git pager..."

# Check if delta is installed
if ! command -v delta >/dev/null 2>&1; then
    echo "Error: delta is not installed."
    echo "Install it with: brew install delta"
    exit 1
fi

# Set delta as the git pager
git config --global core.pager delta

# Configure delta for interactive rebase/merge
git config --global interactive.diffFilter 'delta --color-only'

# Enable navigation (use arrow keys to move between files)
git config --global delta.navigate true

# Enable side-by-side view (optional - comment out if you prefer unified view)
git config --global delta.side-by-side true

# Show line numbers
git config --global delta.line-numbers true

# Set syntax theme (options: Dracula, GitHub, Monokai, Nord, OneDark, Solarized-dark, etc.)
git config --global delta.syntax-theme "Dracula"

# Additional useful delta settings
git config --global delta.plus-style 'syntax "#003800"'  # Green for additions
git config --global delta.minus-style 'syntax "#3f0001"' # Red for deletions
git config --global delta.plus-non-emph-style 'syntax "#003800"'
git config --global delta.minus-non-emph-style 'syntax "#3f0001"'

# Show file renames
git config --global delta.file-style 'blue bold'

# Show hunk headers
git config --global delta.hunk-header-style 'file line-number syntax'

echo ""
echo "✅ Delta configured successfully!"
echo ""
echo "Current delta configuration:"
git config --global --list | grep delta
echo ""
echo "Test it with: git diff"
echo "Or view a file: git show HEAD:filename"

