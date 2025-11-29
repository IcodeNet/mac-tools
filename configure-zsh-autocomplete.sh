#!/bin/bash
# Configure zsh with zinit and fzf-tab for enhanced autocompletion
# This script sets up the terminal intellisense/autocomplete features
# Run this after installing packages from Brewfile

set -e

echo "=========================================="
echo "Configuring Zsh Autocompletion"
echo "=========================================="
echo ""

# Check if zsh is installed
if ! command -v zsh >/dev/null 2>&1; then
    echo "Error: zsh is not installed. Please install it first:"
    echo "  brew install zsh"
    exit 1
fi

# Check if fzf is installed
if ! command -v fzf >/dev/null 2>&1; then
    echo "Error: fzf is not installed. Please install it first:"
    echo "  brew install fzf"
    exit 1
fi

# Check if starship is installed
if ! command -v starship >/dev/null 2>&1; then
    echo "⚠️  Starship is not installed. Installing prompt theme is optional."
    echo "   Install it with: brew install starship"
    echo "   Or run: bash install-brewfile.sh"
    echo ""
    STARSHIP_INSTALLED=false
else
    STARSHIP_INSTALLED=true
    echo "✅ Starship found: $(starship --version | head -1)"
    echo ""
fi

# Backup existing .zshrc if it exists
ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
    BACKUP="${ZSHRC}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "📦 Backing up existing .zshrc to: $BACKUP"
    cp "$ZSHRC" "$BACKUP"
    echo "✅ Backup created"
    echo ""
fi

# Install zinit if not already installed
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    echo "📥 Installing zinit plugin manager..."
    mkdir -p "$HOME/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" || {
        echo "Error: Failed to install zinit"
        exit 1
    }
    echo "✅ zinit installed"
    echo ""
else
    echo "✅ zinit already installed"
    echo ""
fi

# Create or update .zshrc with proper configuration
echo "⚙️  Configuring .zshrc with autocompletion setup..."
echo ""

# Check if zinit is already configured
if grep -q "zinit.git/zinit.zsh" "$ZSHRC" 2>/dev/null; then
    echo "⚠️  zinit is already configured in .zshrc"
    echo "   This script will add/update the autocompletion configuration"
    echo "   If you have custom settings, you may need to merge them manually"
    echo ""
    
    # Check if fzf-tab is already configured
    if grep -q "fzf-tab" "$ZSHRC" 2>/dev/null; then
        echo "⚠️  fzf-tab is already configured"
        echo "   The script will ensure proper plugin loading order"
        echo ""
    fi
fi

# Create a configuration snippet for autocompletion
CONFIG_SNIPPET=$(cat <<'EOF'
# ============================================
# Zinit Plugin Manager (Auto-completion Setup)
# ============================================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f" || \
        print -P "%F{160} The clone has failed.%f"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Ensure compinit is called (zinit does this, but be explicit for fzf-tab)
# This must happen before fzf-tab loads
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# ============================================
# Essential Plugins (Autocompletion Setup)
# ============================================
# IMPORTANT: Load order matters for fzf-tab!

# Better completion (load first, before fzf-tab)
zinit light zsh-users/zsh-completions

# fzf integration for fuzzy finding (needed by fzf-tab)
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf-bin

# fzf-tab - Tab completion using fzf
# MUST load after zsh-completions but BEFORE autosuggestions/syntax-highlighting
# This ensures fzf-tab can bind Tab key properly
zinit light Aloxaf/fzf-tab

# Auto-suggestions (load after fzf-tab)
zinit light zsh-users/zsh-autosuggestions

# Better history search with fzf
zinit light joshskidmore/zsh-fzf-history-search

# Fast syntax highlighting (must be loaded LAST)
zinit light zdharma-continuum/fast-syntax-highlighting

# ============================================
# fzf Configuration
# ============================================
# Setup fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============================================
# fzf-tab Configuration
# ============================================
# Enable completion for all commands
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _expand _complete _files _correct _approximate

# fzf-tab specific configuration
# Force zsh not to show completion menu, allowing fzf-tab to capture
zstyle ':completion:*' menu no
# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# Preview directory's content when completing cd (use ls if exa not available)
if command -v exa >/dev/null 2>&1; then
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
else
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
fi
# Switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# Enable continuous trigger (tab multiple times)
zstyle ':fzf-tab:*' continuous-trigger 'space'
EOF
)

# Append configuration if .zshrc doesn't exist or doesn't have zinit
if [ ! -f "$ZSHRC" ] || ! grep -q "zinit.git/zinit.zsh" "$ZSHRC" 2>/dev/null; then
    echo "📝 Creating new .zshrc with autocompletion configuration..."
    cat > "$ZSHRC" <<'BASIC_CONFIG'
# Zsh Configuration with Autocompletion
# Generated by configure-zsh-autocomplete.sh

# Basic PATH setup
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

BASIC_CONFIG
    echo "$CONFIG_SNIPPET" >> "$ZSHRC"
    
    # Add Starship initialization if installed
    if [ "$STARSHIP_INSTALLED" = true ]; then
        echo "" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "# Starship Prompt" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "" >> "$ZSHRC"
        echo "eval \"\$(starship init zsh)\"" >> "$ZSHRC"
    fi
    
    echo "" >> "$ZSHRC"
    echo "# ============================================" >> "$ZSHRC"
    echo "# Additional Configuration" >> "$ZSHRC"
    echo "# ============================================" >> "$ZSHRC"
    echo "" >> "$ZSHRC"
    echo "✅ Created new .zshrc"
else
    echo "📝 Updating existing .zshrc..."
    
    # Check if we need to add the configuration
    if ! grep -q "fzf-tab" "$ZSHRC" 2>/dev/null; then
        echo "" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "# Autocompletion Configuration" >> "$ZSHRC"
        echo "# Added by configure-zsh-autocomplete.sh" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "$CONFIG_SNIPPET" >> "$ZSHRC"
        echo "✅ Added autocompletion configuration to existing .zshrc"
    else
        echo "⚠️  fzf-tab is already configured"
        echo "   You may want to review the plugin loading order in .zshrc"
        echo "   Ensure fzf-tab loads BEFORE autosuggestions and syntax-highlighting"
    fi
    
    # Add Starship initialization if installed and not already present
    if [ "$STARSHIP_INSTALLED" = true ] && ! grep -q "starship init zsh" "$ZSHRC" 2>/dev/null; then
        echo "" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "# Starship Prompt" >> "$ZSHRC"
        echo "# Added by configure-zsh-autocomplete.sh" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "" >> "$ZSHRC"
        echo "eval \"\$(starship init zsh)\"" >> "$ZSHRC"
        echo "✅ Starship initialization added to .zshrc"
    fi
fi

echo ""
echo "=========================================="
echo "Configuration Complete!"
echo "=========================================="
echo ""
echo "✅ zinit plugin manager: Installed"
echo "✅ fzf-tab: Configured"
echo "✅ zsh-autosuggestions: Configured"
echo "✅ zsh-completions: Configured"
echo "✅ fast-syntax-highlighting: Configured"

# Configure Starship prompt if installed
if [ "$STARSHIP_INSTALLED" = true ]; then
    echo "🎨 Configuring Starship prompt..."
    
    STARSHIP_CONFIG_DIR="$HOME/.config"
    STARSHIP_CONFIG="$STARSHIP_CONFIG_DIR/starship.toml"
    
    # Create .config directory if it doesn't exist
    mkdir -p "$STARSHIP_CONFIG_DIR"
    
    # Only create config if it doesn't exist (don't overwrite user's custom config)
    if [ ! -f "$STARSHIP_CONFIG" ]; then
        echo "📝 Creating Starship configuration..."
        cat > "$STARSHIP_CONFIG" <<'STARSHIP_EOF'
# Starship Prompt Configuration
# Fast, minimal, and customizable prompt
# Generated by configure-zsh-autocomplete.sh

format = """
[╭─](bold blue)$username\
$hostname\
$shlvl\
$directory\
$git_branch\
$git_state\
$git_status\
$git_metrics\
$docker_context\
$package\
$golang\
$nodejs\
$rust\
$python\
$conda\
$memory_usage\
$aws\
$env_var\
$custom\
$sudo\
$cmd_duration\
$line_break\
[╰─](bold blue)$character"""

# Username
[username]
show_always = false
format = "[$user]($style) "
style_user = "bold blue"
style_root = "bold red"

# Hostname
[hostname]
ssh_only = false
format = "@[$hostname]($style) "
style = "bold green"

# Directory
[directory]
truncation_length = 3
truncate_to_repo = true
format = "in [$path]($style)[$read_only]($read_only_style) "
style = "bold cyan"
read_only = " 🔒"
read_only_style = "red"

# Git Branch
[git_branch]
format = "on [$symbol$branch(:$remote_branch)]($style) "
symbol = " "
style = "bold purple"

# Git Status
[git_status]
format = '([\[$all_status$ahead_behind\]]($style) )'
style = "bold red"
conflicted = "🏳 "
up_to_date = "✓"
untracked = "🤷"
ahead = "⇡${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
behind = "⇣${count}"
stashed = "📦"
modified = "📝"
staged = '[++\($count\)](green)'
renamed = "👅"
deleted = "🗑"

# Node.js
[nodejs]
format = "via [$symbol($version )]($style)"
symbol = " "
style = "bold green"

# Python
[python]
format = "via [$symbol($version )]($style)"
symbol = " "
style = "bold yellow"

# Rust
[rust]
format = "via [$symbol($version )]($style)"
symbol = " "
style = "bold red"

# Package
[package]
format = "is [$symbol$version]($style) "
symbol = "📦 "
style = "bold 208"

# Command Duration
[cmd_duration]
min_time = 2_000
format = "took [$duration]($style) "
style = "bold yellow"

# Line Break
[line_break]
disabled = false

# Character
[character]
success_symbol = "[❯](bold green)"
error_symbol = "[❯](bold red)"
STARSHIP_EOF
        echo "✅ Starship configuration created at $STARSHIP_CONFIG"
    else
        echo "⚠️  Starship config already exists at $STARSHIP_CONFIG"
        echo "   Skipping configuration to preserve your custom settings"
    fi
    
    # Add Starship initialization to .zshrc if not already present
    if ! grep -q "starship init zsh" "$ZSHRC" 2>/dev/null; then
        echo "" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "# Starship Prompt" >> "$ZSHRC"
        echo "# ============================================" >> "$ZSHRC"
        echo "" >> "$ZSHRC"
        echo "eval \"\$(starship init zsh)\"" >> "$ZSHRC"
        echo "✅ Starship initialization added to .zshrc"
    else
        echo "✅ Starship already configured in .zshrc"
    fi
    echo "✅ Starship prompt: Configured"
    echo ""
else
    echo "⚠️  Starship not installed - skipping prompt configuration"
    echo "   Install with: brew install starship"
    echo "   Then run this script again to configure it"
    echo ""
fi

echo ""
echo "📋 Next Steps:"
echo "   1. Restart your terminal or run: source ~/.zshrc"
echo "   2. Test tab completion: cd <Tab>"
echo "   3. You should see a fuzzy searchable menu"
echo ""
echo "🧪 Test Commands:"
echo "   cd <Tab>              # Fuzzy search directories"
echo "   git checkout <Tab>    # Fuzzy search branches"
echo "   Ctrl+R                # Search command history"
echo "   Ctrl+T                # Search files"
echo ""
echo "💡 If tab completion doesn't work:"
echo "   1. Make sure you're in an interactive shell (not a script)"
echo "   2. Try: rm ~/.zcompdump* && exec zsh"
echo "   3. Check that fzf is installed: fzf --version"
echo ""

