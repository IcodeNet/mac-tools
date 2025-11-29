#!/bin/bash
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)" || [ -f /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
cd "$(dirname "$0")" && brew bundle install --file Brewfile --no-upgrade && echo "✅ Installation complete!"

