# filename: Brewfile
# Note: homebrew/core and homebrew/cask taps are included by default, no need to specify

brew "zsh"
# Note: zinit is not a Homebrew package - it's installed via .zshrc
brew "fzf"
brew "ripgrep"
brew "fd"
brew "eza"
brew "bat"
brew "jq"
brew "httpie"
# ngrok is a cask, not a formula
# cask "ngrok"
# ⚠️ COST: Free tier available (limited), paid plans start at $8/month for more features
#    Uncomment above line to install. Free tier works for basic tunneling needs.
brew "direnv"
brew "delta"
brew "volta"
brew "pnpm"
brew "git"
brew "gh"
brew "tree"
brew "btop"
brew "tmux"
brew "starship"
brew "powerlevel10k"
brew "libpq"
brew "pgcli"

cask "iterm2" # optional if you want iTerm2 alongside Warp
# cask "warp" # Modern Rust-based terminal (alternative to iTerm2)
# ⚠️ COST: Free for personal use, paid plans for teams ($12/user/month)
#    Uncomment above line to install. Free tier is excellent for individual developers.

# Productivity tools with intellisense/autocomplete
# cask "raycast" # Best-of-breed app launcher with extensions and intellisense
# ⚠️ COST: Free tier available, but Pro features require subscription ($8/month or $80/year)
#    Uncomment above line to install. Free tier is quite capable for most users.
# cask "alfred" # Powerful app launcher and productivity tool (alternative to Raycast)
# ⚠️ COST: Free tier available, but Powerpack requires one-time purchase ($59) or subscription
#    Uncomment above line to install. Free tier is functional but limited.
cask "dash" # API documentation browser with code snippets and autocomplete

# AI/ML Development Tools
brew "python@3.12" # Python for AI/ML development (latest stable)
brew "jupyterlab" # Jupyter Lab for interactive notebooks and data science
brew "yarn" # Fast, reliable package manager (alternative to pnpm)
# Note: Bun can be installed via: curl -fsSL https://bun.sh/install | bash

# Python Package & Environment Management
brew "uv" # Extremely fast Python package installer and resolver (written in Rust) - https://docs.astral.sh/uv/
brew "poetry" # Python dependency management and packaging tool - https://python-poetry.org/
brew "pdm" # Modern Python package and dependency manager (PEP 517/621 compliant) - https://pdm-project.org
brew "hatch" # Modern, extensible Python project management and build tool - https://hatch.pypa.io/
brew "virtualenv" # Tool for creating isolated virtual Python environments - https://virtualenv.pypa.io/
cask "miniconda" # Minimal installer for conda (includes conda and mamba) - https://docs.conda.io/
# Note: mamba is included with miniconda/conda installations
# Alternative standalone: brew "micromamba" # Fast conda package manager (standalone, no conda needed)
#    Micromamba is faster and lighter than full conda/mamba installation
#    Setup: micromamba shell init --shell zsh --root-prefix ~/mamba
# Alternative: anaconda (larger, includes many pre-installed packages) - cask "anaconda"

# React/Expo Development Tools
brew "node@20" # Node.js LTS for React/Expo development (npm comes automatically with Node.js)
brew "watchman" # File watching service (essential for React Native/Expo hot reloading)
# Note: You already have volta installed (line 17) - a fast Node.js version manager
# Alternative Node version managers (choose one):
# brew "nvm" # Node Version Manager (note: upstream doesn't officially support Homebrew install)
# brew "n" # Simple Node version manager (alternative to nvm)
# API Testing & Mocking Tools
cask "bruno" # Open-source API client (alternative to Postman) - https://www.usebruno.com/
cask "mockoon" # API mocking tool for local development and testing - https://mockoon.com/

# Docker Desktop - Note: Requires sudo password during installation
# If installation fails, you may need to run: brew install --cask docker-desktop manually
# Or consider Rancher Desktop as alternative (see below)
cask "docker-desktop" # Docker Desktop for containerization (AI models, React apps)
# ⚠️ COST: Free for personal/educational use, but requires paid subscription for commercial use
#    in larger organizations (typically $5-7/user/month for Business plan)
#    Uncomment above line to install. Free tier is sufficient for most developers.
# Alternative to Docker Desktop: Rancher Desktop (not available via Homebrew, FREE and open-source)
# Install manually: https://rancherdesktop.io/ - Provides Kubernetes + container runtime
# Supports both containerd and dockerd (moby) engines, great for K8s development

# Code Quality & Testing Tools
brew "typescript" # TypeScript compiler (essential for modern React/Expo)
# Note: ESLint and Prettier are typically installed per-project via npm/pnpm/yarn
# Install globally: npm install -g eslint prettier

# .NET Development Tools
brew "dotnet@8" # .NET 8 SDK for C# and .NET development
brew "dotnet" # .NET 9 SDK (latest stable) for C# and .NET development
# Note: Both .NET 8 and 9 can be installed simultaneously
# dotnet@8 is keg-only, add to PATH: export DOTNET_ROOT="/opt/homebrew/opt/dotnet@8/libexec"
# dotnet (9) is keg-only, add to PATH: export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
# Use: dotnet --version to see which version is active (defaults to latest installed)

# Azure Development Tools
# ⚠️ COST: Azure services require an Azure subscription (free tier available for 12 months with $200 credit)
#    Tools themselves are free, but using Azure services (Cosmos DB, Storage, etc.) incurs costs
#    Free tier includes: 12 months free services + $200 credit + always-free services
brew "azure-cli" # Azure CLI for managing Azure resources from command line (FREE tool)
brew "azcopy" # Command-line utility for transferring data to/from Azure Storage (FREE tool)
cask "azure-data-studio" # Cross-platform database tool for Azure SQL, Cosmos DB, and more (FREE tool)
cask "microsoft-azure-storage-explorer" # Standalone app for managing Azure Storage accounts (FREE tool)
# Note: Azure Cosmos DB Emulator is Windows-only, use Docker or Azure portal for local development

# Code Editors
cask "cursor" # AI-powered code editor (built on VS Code) - https://cursor.com/
# ⚠️ COST: Free tier available, but Pro features require subscription ($20/month)
#    Uncomment above line to install. Free tier includes AI chat and completions.
cask "visual-studio-code" # VS Code - Essential editor for React, .NET, and AI development (FREE)

# AI/ML Local Tools
cask "ollama" # Local LLM runner - Run models like Llama, Mistral, etc. locally
# ⚠️ COST: FREE - Run AI models locally without API costs
#    Uncomment above line to install. Great for privacy and offline AI development.

# Mobile Development Tools
# cask "android-studio" # Android development IDE (required for React Native Android builds)
# ⚠️ COST: FREE - Open source Android development environment
#    Uncomment above line to install. Essential for React Native/Expo Android development.

# Git GUI Clients
# cask "gitkraken" # Beautiful Git GUI client with visual history
# ⚠️ COST: Free for non-commercial use, paid for commercial ($4.95/user/month)
#    Uncomment above line to install. Great alternative to command-line git.
# Note: GitHub Desktop is also available but not via Homebrew (download from github.com)

# Browsers
# cask "google-chrome" # Google Chrome browser
# ⚠️ COST: FREE
#    Uncomment above line to install. Useful for testing web applications.

# Clipboard Managers
# cask "maccy" # Lightweight clipboard manager - https://maccy.app/
# ⚠️ COST: FREE and open-source
#    Uncomment above line to install. Great for managing clipboard history.
# cask "copyclip" # Clipboard manager with history - https://fiplab.com/apps/copyclip-for-mac
# ⚠️ COST: FREE (basic), paid version available
#    Uncomment above line to install. Alternative to Maccy.

# Window Management
# Note: Magnet is NOT available via Homebrew (Mac App Store only, $4.99)
#    Install manually from: https://apps.apple.com/app/magnet/id441258766
#    Alternative window managers available via Homebrew: rectangle, spectacle

# VPN Tools
# cask "expressvpn" # VPN client for secure internet access
# ⚠️ COST: Paid subscription required (typically $6.67-12.95/month)
#    Uncomment above line to install. Requires ExpressVPN subscription.

# Communication Tools
# cask "whatsapp" # Native desktop client for WhatsApp
# ⚠️ COST: FREE
#    Uncomment above line to install. Desktop version of WhatsApp.

# Additional Productivity Tools
# cask "notion" # All-in-one workspace with AI capabilities for project management
# ⚠️ COST: Free tier available, but paid plans for teams ($8-15/user/month)
#    AI features may require paid plan. Uncomment above line to install.

