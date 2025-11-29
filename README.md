# Mac Development Tools Setup

This directory contains tools and scripts to set up a complete development environment on macOS using Homebrew.

## 📁 Contents

- **`Brewfile`** - Declarative list of all development tools and packages
- **`install-brewfile.sh`** - Full-featured installation script with error handling
- **`install-now.sh`** - Quick one-liner installation script
- **`configure-delta.sh`** - Configure delta as git pager for beautiful diffs
- **`configure-zsh-autocomplete.sh`** - Configure zsh with fzf-tab and autocompletion plugins

## 📋 Prerequisites

- macOS (Ventura 13+ or higher recommended)
- Administrator access (for some installations like Docker Desktop)
- Internet connection

## 🚀 Quick Start

### Step 0: Install Homebrew (If Not Already Installed)

If you don't have Homebrew installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, add Homebrew to your PATH:

```bash
# For Apple Silicon Macs
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# For Intel Macs
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```

### Step 1: Clone or Navigate to mac-tools Directory

```bash
# If you have this in a git repo
git clone https://github.com/IcodeNet/mac-tools.git ~/dev/mac-tools
cd ~/dev/mac-tools

# Or if you already have it
cd ~/dev/mac-tools
```

### Step 2: Install All Packages

**Option 1: Full Installation Script (Recommended)**

```bash
bash install-brewfile.sh
```

This script:

- ✅ Sets PATH correctly
- ✅ Detects Homebrew automatically
- ✅ Handles errors gracefully (including sudo password prompts)
- ✅ Shows progress and results
- ✅ Safe to run multiple times (idempotent)

**Option 2: Quick Installation**

```bash
bash install-now.sh
```

**Option 3: Direct Homebrew Command**

```bash
brew bundle install --file Brewfile --no-upgrade
```

### Step 3: Configure Terminal Autocompletion ⭐ **IMPORTANT**

**This step sets up fuzzy tab completion and command suggestions:**

```bash
bash configure-zsh-autocomplete.sh
```

This will configure:

- ✅ zinit plugin manager
- ✅ fzf-tab (fuzzy searchable tab completions)
- ✅ zsh-autosuggestions (command suggestions)
- ✅ zsh-completions (enhanced completions)
- ✅ fast-syntax-highlighting (syntax colors)
- ✅ Starship prompt (if installed) - Beautiful, informative prompt with git status, language versions, and more

**After running this script:**

1. **Restart your terminal** (close and reopen completely)
2. Or run: `source ~/.zshrc`

**Test it:**

```bash
cd <Tab>              # Should show fuzzy searchable menu
git checkout <Tab>     # Should show fuzzy branch search
Ctrl+R                 # Should show fuzzy history search
```

### Step 4: Configure Git Pager (Optional)

For beautiful git diffs:

```bash
bash configure-delta.sh
```

### Step 5: Verify Installation

```bash
# Check key tools
zsh --version
fzf --version
git --version
node --version
python3 --version

# Check if autocompletion is working
# In a new terminal, try: cd <Tab>
```

## 🎯 What You Get

### Terminal Features

After running `configure-zsh-autocomplete.sh`, you'll have:

- **Beautiful Prompt** - Starship prompt with git status, language versions, and contextual information
- **Fuzzy Tab Completion** - Type `cd <Tab>` to see searchable directory menu
- **Command Suggestions** - Gray text suggests commands as you type (press `→` to accept)
- **Enhanced Completions** - Better completions for git, python, npm, etc.
- **Syntax Highlighting** - Commands are colored as you type
- **History Search** - `Ctrl+R` for fuzzy command history search
- **File Search** - `Ctrl+T` for fuzzy file search

### Development Tools

- **Modern CLI Tools** - eza (ls), bat (cat), fd (find), ripgrep (grep)
- **Package Managers** - npm, pnpm, yarn, pip, uv, poetry, pdm, hatch, conda/mamba
- **Version Managers** - volta (Node.js), pyenv (Python)
- **Container Tools** - Docker Desktop, Rancher Desktop
- **Code Editors** - VS Code, Cursor
- **And much more** - See full tool list below

## 📋 What These Tools Do

### Installation Scripts

Both installation scripts perform the same core function but with different levels of detail:

1. **Set PATH correctly** - Ensures all system commands (`curl`, `grep`, `cut`, etc.) are available
2. **Detect Homebrew** - Automatically finds Homebrew installation (Apple Silicon or Intel)
3. **Install packages** - Installs all packages listed in the Brewfile
4. **Idempotent** - Safe to run multiple times; skips already installed packages

**Why we need them:**

- **PATH Safety**: Prevents "command not found" errors during installation
- **Automation**: One command installs your entire development environment
- **Reproducibility**: Same setup on any Mac, anytime
- **Idempotency**: Can run multiple times without breaking anything

### Brewfile

The `Brewfile` is a declarative configuration file that lists all your development tools. It's like a `package.json` for your Mac.

**What it contains:**

- **Core Tools**: zsh, git, gh (GitHub CLI)
- **Modern CLI Tools**: eza (ls), bat (cat), fd (find), ripgrep (grep)
- **Development Tools**: direnv, volta, pnpm, fzf, jq, httpie
- **System Tools**: btop, tmux, starship, powerlevel10k
- **Database Tools**: libpq, pgcli
- **Applications**: ngrok, iterm2

**Why we need it:**

- **Version Control**: Track your development environment setup
- **Quick Setup**: Set up a new Mac in minutes
- **Team Consistency**: Share the same tools across your team
- **Documentation**: Self-documenting list of what you use

## 🛠️ Installed Tools Overview

### Core Development

- **zsh** - Modern shell with better features than bash
- **git** - Version control system
- **gh** - GitHub CLI for managing repositories and issues

### Modern CLI Replacements

- **eza** - Modern `ls` with colors, icons, and better formatting
- **bat** - Modern `cat` with syntax highlighting and Git integration
- **fd** - Fast, user-friendly alternative to `find`
- **ripgrep (rg)** - Extremely fast text search tool
- **delta** - Beautiful Git diff viewer

### Development Tools

- **direnv** - Automatically load/unload environment variables per directory
- **volta** - Fast, reliable JavaScript tool manager and Node.js version manager
- **pnpm** - Fast, disk space efficient package manager
- **fzf** - Fuzzy finder for command-line
- **jq** - Command-line JSON processor
- **httpie** - User-friendly HTTP client
- **yarn** - Fast, reliable package manager (alternative to pnpm)
- **typescript** - TypeScript compiler for type-safe JavaScript development

### System & Productivity

- **btop** - Modern system monitor (better than htop)
- **tmux** - Terminal multiplexer for managing multiple sessions
- **starship** - Fast, customizable cross-shell prompt
- **powerlevel10k** - Zsh theme framework
- **tree** - Display directory structure

### Database Tools

- **libpq** - PostgreSQL client library
- **pgcli** - Interactive PostgreSQL CLI with autocompletion

### Node.js & JavaScript Development

- **node@20** - Node.js LTS for React/Expo development
- **npm** - Comes automatically with Node.js (no separate installation needed)
- **volta** - Fast Node.js version manager (already installed, see line 17)
- **watchman** - File watching service (essential for React Native/Expo hot reloading)
- **yarn** - Fast, reliable package manager
- **pnpm** - Fast, disk space efficient package manager (already installed)
- **typescript** - TypeScript compiler for type-safe development

**Node Version Managers:**

- **Volta** (already installed) - Fast, reliable, recommended
- **nvm** - Available via Homebrew (note: upstream doesn't officially support Homebrew install)
- **n** - Simple alternative to nvm, also available via Homebrew

### AI/ML Development Tools

- **python@3.12** - Python for AI/ML development (latest stable version)
- **jupyterlab** - Jupyter Lab for interactive notebooks and data science
- **docker-desktop** - Containerization for AI models and development environments
- **Rancher Desktop** (manual install) - Alternative to Docker Desktop with built-in Kubernetes support

### React/Expo Development Tools

- **node@20** - Node.js LTS (see Node.js section above)
- **watchman** - File watching for hot reloading (see Node.js section above)
- **bruno** - Open-source API client (alternative to Postman) for testing REST/GraphQL APIs
- **mockoon** - API mocking tool for local development and testing
- **docker-desktop** - Containerization for React apps and services
- **Rancher Desktop** (manual install) - Alternative container runtime with Kubernetes
- **typescript** - Type-safe JavaScript (see Node.js section above)
- **visual-studio-code** - Essential editor for React, .NET, and AI development

### .NET Development Tools

- **dotnet@8** - .NET 8 SDK for C# and .NET development
- **dotnet** - .NET 9 SDK (latest stable) for C# and .NET development
- **visual-studio-code** - VS Code with C# extension for .NET development
- **Note**: Both .NET 8 and 9 are installed and can be used simultaneously

### Azure Development Tools

- **azure-cli** - Azure CLI for managing Azure resources from command line
- **azcopy** - Command-line utility for transferring data to/from Azure Storage
- **azure-data-studio** - Cross-platform database tool for Azure SQL, Cosmos DB, and more
- **microsoft-azure-storage-explorer** - Standalone app for managing Azure Storage accounts
- **Note**: Azure Cosmos DB Emulator is Windows-only; use Docker or Azure portal for local development

### Applications

- **ngrok** - Secure tunneling to localhost (see usage below)
- **iterm2** - Advanced terminal emulator
- **raycast** - Best-of-breed app launcher with extensions, intellisense, and productivity features
- **dash** - API documentation browser with code snippets, autocomplete, and offline access
- **bruno** - Open-source API client (replaces Postman)
- **mockoon** - API mocking tool for local development
- **docker-desktop** - Docker Desktop for containerization
- **notion** - All-in-one workspace with AI capabilities for project management
- **visual-studio-code** - VS Code editor (essential for multi-language development)

## 🔄 Updating Tools

To update all installed packages:

```bash
brew update
brew upgrade
```

To update specific packages, edit the Brewfile and run the installation script again.

## 🧹 Removing Tools

To remove packages not in your Brewfile:

```bash
cd ~/dev/mac-tools
brew bundle cleanup --file Brewfile
```

## 📝 Customization

### Adding New Tools

1. Edit `Brewfile`
2. Add the package: `brew "package-name"` or `cask "app-name"`
3. Run the installation script again

### Removing Tools

1. Remove the line from `Brewfile`
2. Run: `brew uninstall package-name` (or `brew uninstall --cask app-name`)

## 🔍 Troubleshooting

### "Command not found" errors

The installation scripts set PATH correctly. If you still see errors:

1. Make sure you're running the script from the `mac-tools` directory
2. Check that Homebrew is installed: `brew --version`
3. Restart your terminal after installation

### Symlink conflicts

If you see symlink errors (like with pnpm), run:

```bash
brew link --overwrite package-name
```

### Package already installed

The scripts are idempotent - they'll skip already installed packages. This is normal and safe.

## 📚 Additional Resources

- [Homebrew Documentation](https://docs.brew.sh)
- [Brewfile Documentation](https://github.com/Homebrew/homebrew-bundle)
- [Homebrew Formulae](https://formulae.brew.sh)

## 🎨 Additional Configuration Scripts

### Configure Terminal Autocompletion

**After installing packages**, set up enhanced terminal autocompletion:

```bash
cd ~/dev/mac-tools
bash configure-zsh-autocomplete.sh
```

This script configures:

- **Starship prompt** - Beautiful, informative prompt with git status, language versions, and more (if installed)
- **fzf-tab** - Fuzzy searchable tab completions (`cd <Tab>` shows searchable menu)
- **zsh-autosuggestions** - Command suggestions as you type (press `→` to accept)
- **zsh-completions** - Enhanced tab completions for all commands
- **fast-syntax-highlighting** - Real-time syntax highlighting

**Features:**

- Fuzzy searchable tab completions for all commands
- Command suggestions based on history
- Enhanced completions for git, python, npm, etc.
- Syntax highlighting as you type

**Test it:**

- `cd <Tab>` - Fuzzy search directories
- `git checkout <Tab>` - Fuzzy search branches
- `Ctrl+R` - Search command history
- `Ctrl+T` - Search files

### Configure Delta (Git Pager)

For beautiful git diffs:

```bash
cd ~/dev/mac-tools
bash configure-delta.sh
```

This will set up delta with:

- Side-by-side diff view
- Syntax highlighting
- Line numbers
- Navigation support (arrow keys)
- Dracula theme (customizable)

**What is delta?**
Delta is a syntax-highlighting pager for git, diffs, and grep output. It makes reading code changes much easier with:

- Color-coded additions (green) and deletions (red)
- Syntax highlighting for code
- Side-by-side comparison view
- Better readability than default git diff

## 🚀 Productivity Tools with Intellisense

### Raycast (App Launcher)

Raycast is a powerful app launcher that provides intelligent autocomplete and productivity features:

- **Fast app/file search** with fuzzy matching
- **Extensions ecosystem** - GitHub, Jira, Linear, and more
- **Clipboard history** with search
- **Window management** and quick actions
- **Custom workflows** and scripts

**Usage:**

- Press `Cmd+Space` (or customize) to open Raycast
- Type to search apps, files, or use extensions
- Install extensions from the Raycast Store

### Dash (API Documentation Browser)

Dash provides offline access to API documentation with intelligent search:

- **200+ docsets** for popular frameworks and languages
- **Code snippets** management
- **Intelligent autocomplete** for API references
- **Offline access** - works without internet
- **Integration** with editors (VS Code, Cursor, etc.)

**Usage:**

- Search API documentation offline
- Store and organize code snippets
- Quick reference while coding

### Terminal Intellisense & Autocompletion Setup

**🚀 Quick Setup (Recommended):**

After installing packages from Brewfile, run the autocompletion setup script:

```bash
cd ~/dev/mac-tools
bash configure-zsh-autocomplete.sh
```

This script will:

- ✅ Install zinit plugin manager
- ✅ Configure Starship prompt (if installed) - Beautiful prompt with git status, language versions, and contextual info
- ✅ Configure fzf-tab for fuzzy tab completion
- ✅ Set up zsh-autosuggestions (command suggestions)
- ✅ Configure zsh-completions (enhanced completions)
- ✅ Set up fast-syntax-highlighting (syntax colors)
- ✅ Configure proper plugin loading order

**What You Get:**

1. **Starship Prompt** - Beautiful, informative prompt (if Starship is installed)

   - Shows git branch, status, and commit info
   - Displays language versions (Node.js, Python, Rust, etc.)
   - Shows directory path with smart truncation
   - Command execution time for long-running commands
   - Customizable colors and format

2. **fzf-tab** - Beautiful fuzzy searchable tab completions

   - Type `cd <Tab>` to see fuzzy searchable directory menu
   - Type to filter, arrow keys to navigate, Enter to select
   - Works for all commands (git, python, etc.)

3. **zsh-autosuggestions** - Command suggestions as you type

   - Gray text appears showing suggestions from history
   - Press `→` (right arrow) to accept suggestion

4. **zsh-completions** - Enhanced tab completions

   - Better completions for many commands
   - Press `Tab` once to complete, twice to see options

5. **fast-syntax-highlighting** - Real-time syntax highlighting

   - Valid commands in green, invalid in red
   - Colors file paths, options, etc.

5. **fzf** - Fuzzy finder (already installed via Brewfile)
   - `Ctrl+R` - Search command history
   - `Ctrl+T` - Search files in current directory
   - `Alt+C` - Search and cd into directories

**Manual Setup (If Needed):**

If you prefer to configure manually, the plugins are:

- `zsh-autosuggestions` - Suggests commands as you type based on history
- `zsh-syntax-highlighting` - Real-time syntax highlighting for commands
- `zsh-completions` - Additional completion definitions
- `fzf-tab` - Fuzzy tab completion using fzf

**Important:** Plugin loading order matters! fzf-tab must load BEFORE autosuggestions and syntax-highlighting. The setup script handles this automatically.

**Testing:**

After running the setup script:

1. Restart your terminal or run: `source ~/.zshrc`
2. Test: `cd <Tab>` - should show fuzzy searchable menu
3. Test: `git checkout <Tab>` - should show fuzzy branch search
4. Test: `Ctrl+R` - should show fuzzy history search

**Troubleshooting:**

If tab completion doesn't work:

```bash
# Rebuild completion cache
rm ~/.zcompdump* && exec zsh

# Verify fzf is installed
fzf --version

# Check if plugins are loaded
zinit list
```

## 📦 Node.js, npm, and Version Managers

### Node.js and npm

**Node.js** is installed via Homebrew (`node@20` - LTS version). **npm** (Node Package Manager) comes automatically with Node.js - you don't need to install it separately.

**Verify installation:**

```bash
node --version  # Should show v20.x.x or higher
npm --version   # Should show 10.x.x or higher
```

### Node Version Managers

You have **Volta** already installed (line 17 in Brewfile), which is a fast and reliable Node.js version manager. Here are your options:

#### Volta (Recommended - Already Installed)

- **Fast** - Written in Rust, very performant
- **Automatic** - Automatically switches Node versions per project
- **Reliable** - No shell startup delays

**Usage:**

```bash
volta install node@20    # Install Node.js version
volta install node@18    # Install another version
volta pin node@20        # Pin version for current project
```

#### nvm (Alternative)

Available via Homebrew, but note: upstream doesn't officially support Homebrew installation. Better to install via their official script:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```

#### n (Alternative)

Simple Node version manager, also available via Homebrew:

```bash
brew install n
n lts          # Install latest LTS
n latest        # Install latest version
```

**Recommendation:** Stick with Volta since it's already installed and is the fastest option.

### Package Managers

You have multiple package managers available:

- **npm** - Comes with Node.js (default)
- **pnpm** - Already installed (line 18), fast and disk-efficient
- **yarn** - Added to Brewfile, fast and reliable

**Choose based on your needs:**

- **npm** - Default, works everywhere
- **pnpm** - Best for disk space and speed
- **yarn** - Great for large monorepos

## 🐳 Containerization Tools

### Docker Desktop (Installed via Homebrew)

**Docker Desktop** is included in the Brewfile and provides:

- Container runtime (Docker Engine)
- Docker CLI tools
- GUI for managing containers
- Built-in Kubernetes (optional)

**Usage:**

```bash
docker --version  # Verify installation
docker ps         # List running containers
docker run hello-world  # Test Docker
```

### Rancher Desktop (Alternative - Manual Install)

**Rancher Desktop** is a great alternative to Docker Desktop, especially if you need Kubernetes:

**Features:**

- ✅ Built-in Kubernetes (no separate setup needed)
- ✅ Supports both `containerd` and `dockerd (moby)` engines
- ✅ Open-source and free
- ✅ Works with Docker CLI (when using dockerd engine)
- ✅ Better for Kubernetes development

**Installation (Manual - Not via Homebrew):**

1. Visit https://rancherdesktop.io/
2. Download the `.dmg` for your Mac (Apple Silicon or Intel)
3. Open the `.dmg` and drag to Applications folder
4. Launch and configure:
   - Choose container engine (dockerd for Docker CLI compatibility)
   - Enable Kubernetes if needed
   - Set PATH to "Automatic"

**System Requirements:**

- macOS 13 (Ventura) or higher
- 8 GB RAM minimum (16 GB recommended)
- 4 CPU cores minimum
- Apple Silicon or Intel with VT-x

**When to use Rancher Desktop vs Docker Desktop:**

- **Rancher Desktop**: If you need Kubernetes, prefer open-source, or want built-in K8s
- **Docker Desktop**: If you just need containers, prefer the official Docker tooling, or need Docker Desktop-specific features

**Note:** Both can coexist, but you typically use one at a time. Rancher Desktop can use the same Docker CLI commands when configured with dockerd engine.

## 🔧 API Testing & Mocking Tools

### Bruno (Open-Source API Client)

**Bruno** is a modern, open-source alternative to Postman for API testing:

**Features:**

- ✅ Open-source and free
- ✅ Collections stored as files (version control friendly)
- ✅ No cloud sync required (privacy-focused)
- ✅ Supports REST, GraphQL, and more
- ✅ Beautiful, modern UI
- ✅ Works offline

**Usage:**

- Launch Bruno from Applications
- Create collections to organize your API requests
- Collections are saved as folders (great for Git)
- Perfect for React/Expo backend development

**Website:** https://www.usebruno.com/

### Mockoon (API Mocking)

**Mockoon** is a powerful API mocking tool for local development:

**Features:**

- ✅ Create mock APIs instantly
- ✅ No coding required
- ✅ Supports REST, GraphQL, and WebSockets
- ✅ Environment variables and templating
- ✅ Great for frontend development without backend
- ✅ Export/import mock configurations

**Usage:**

- Launch Mockoon from Applications
- Create mock servers for your React/Expo apps
- Test frontend without waiting for backend APIs
- Perfect for development and testing

**Website:** https://mockoon.com/

## 💻 .NET Development Setup

### .NET SDK Installation

Both **.NET 8** (`dotnet@8`) and **.NET 9** (`dotnet`) are installed via Homebrew. These are "keg-only" formulas, meaning they're not automatically added to your PATH.

**Setup .NET in your shell:**

Add to your `~/.zshrc` (or `~/.bash_profile` if using bash):

```bash
# .NET SDK (defaults to .NET 9, latest)
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
export PATH="$DOTNET_ROOT:$PATH"

# Optional: If you need to switch to .NET 8, use:
# export DOTNET_ROOT="/opt/homebrew/opt/dotnet@8/libexec"
# export PATH="$DOTNET_ROOT:$PATH"
```

Then reload your shell:

```bash
source ~/.zshrc
```

**Verify installation:**

```bash
dotnet --version  # Should show 9.x.x (or 8.x.x if using dotnet@8)
dotnet --list-sdks  # List all installed SDKs (both 8 and 9)
```

### Using Multiple .NET Versions

Both .NET 8 and 9 are installed simultaneously. The `dotnet` command will use whichever version is in your PATH (defaults to .NET 9).

**To switch between versions:**

1. **Change PATH in your shell config** (permanent):

   ```bash
   # For .NET 9 (default)
   export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

   # For .NET 8
   export DOTNET_ROOT="/opt/homebrew/opt/dotnet@8/libexec"
   ```

2. **Use global.json in your project** (project-specific):

   ```json
   {
     "sdk": {
       "version": "8.0.122",
       "rollForward": "latestMinor"
     }
   }
   ```

3. **Check which SDKs are available:**
   ```bash
   dotnet --list-sdks
   # Output will show both versions:
   # 8.0.122 [/opt/homebrew/opt/dotnet@8/libexec]
   # 9.0.8 [/opt/homebrew/opt/dotnet/libexec]
   ```

### VS Code for .NET Development

**Visual Studio Code** is included in the Brewfile. For .NET development:

1. Install the **C# Dev Kit** extension
2. Install the **C#** extension (by Microsoft)
3. Install **.NET Install Tool** extension

**Recommended VS Code Extensions for .NET:**

- C# Dev Kit
- C# (by Microsoft)
- .NET Install Tool
- NuGet Package Manager

## ☁️ Azure Development Setup

### Azure CLI

**Azure CLI** (`az`) is installed via Homebrew. This is the primary tool for managing Azure resources from the command line.

**Initial Setup:**

1. **Login to Azure:**

   ```bash
   az login
   ```

   This will open a browser window for authentication.

2. **Set your default subscription (if you have multiple):**

   ```bash
   az account list --output table  # List all subscriptions
   az account set --subscription "Your Subscription Name or ID"
   ```

3. **Verify installation:**
   ```bash
   az --version  # Show Azure CLI version
   az account show  # Show current subscription
   ```

**Common Azure CLI Commands:**

```bash
# Resource Groups
az group list
az group create --name myResourceGroup --location eastus

# Cosmos DB
az cosmosdb list
az cosmosdb create --name myCosmosDB --resource-group myResourceGroup

# Storage Accounts
az storage account list
az storage account create --name mystorageaccount --resource-group myResourceGroup

# App Services
az webapp list
az functionapp list
```

### AzCopy

**AzCopy** is a command-line utility for transferring data to and from Azure Storage.

**Usage:**

```bash
# Upload files to Azure Blob Storage
azcopy copy "local-path" "https://account.blob.core.windows.net/container" --recursive

# Download from Azure Blob Storage
azcopy copy "https://account.blob.core.windows.net/container" "local-path" --recursive

# Sync directories
azcopy sync "local-path" "https://account.blob.core.windows.net/container" --recursive
```

### Azure Data Studio

**Azure Data Studio** is a cross-platform database tool for:

- Azure SQL Database
- Azure Cosmos DB
- SQL Server
- PostgreSQL
- MySQL

**Features:**

- Query editor with IntelliSense
- Connection management
- Query history
- Extensions marketplace
- Integrated terminal

**Usage:**

1. Launch Azure Data Studio from Applications
2. Connect to your Azure Cosmos DB or SQL Database
3. Use the query editor to run SQL queries
4. Install extensions for additional features

### Azure Storage Explorer

**Azure Storage Explorer** is a standalone app for managing Azure Storage accounts:

**Features:**

- Browse and manage Blob containers, File shares, Queues, and Tables
- Upload, download, and manage files
- View and edit properties
- Generate shared access signatures (SAS)

**Usage:**

1. Launch Azure Storage Explorer from Applications
2. Sign in with your Azure account
3. Browse your storage accounts and resources
4. Right-click for context menus to manage resources

### Azure Cosmos DB Development

**Note:** The Azure Cosmos DB Emulator is Windows-only. For macOS development:

**Option 1: Use Azure Portal**

- Create a Cosmos DB account in Azure Portal
- Use the connection string in your local development
- Free tier available for development

**Option 2: Use Docker (Recommended for Local Development)**

```bash
# Run Cosmos DB emulator in Docker
docker run -p 8081:8081 -p 10250-10255:10250-10255 \
  -m 3g --name azure-cosmosdb-emulator \
  mcr.microsoft.com/cosmosdb/linux/azure-cosmos-emulator
```

**Option 3: Use Azure Data Studio**

- Connect to your Cosmos DB account
- Query and manage databases and containers
- Use the integrated query editor

**VS Code Extensions for Azure:**

- **Azure Databases** - Connect to and manage Azure Cosmos DB
- **Azure Account** - Sign in to Azure
- **Azure App Service** - Deploy to Azure App Service
- **Azure Functions** - Develop Azure Functions
- **Azure Resources** - Browse Azure resources

### Azure Authentication

**Multiple authentication methods:**

1. **Interactive Login (Recommended for development):**

   ```bash
   az login
   ```

2. **Service Principal (For CI/CD):**

   ```bash
   az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>
   ```

3. **Managed Identity (For Azure VMs):**
   ```bash
   az login --identity
   ```

**Check your authentication:**

```bash
az account show  # Current account
az account list  # All available accounts
```

## ⚠️ Installation Notes & Troubleshooting

### Docker Desktop Installation

**Docker Desktop** requires administrator privileges (sudo password) during installation. If the installation fails:

1. **Option 1**: Install manually when prompted for password
2. **Option 2**: Install separately:
   ```bash
   brew install --cask docker-desktop
   ```
3. **Option 3**: Use Rancher Desktop instead (no sudo required)

### Handling Installation Errors

The installation script now handles errors gracefully. If some packages fail:

1. Check the error message
2. For packages requiring sudo (like docker-desktop), install manually
3. Retry failed packages:
   ```bash
   brew bundle install --file Brewfile
   ```

### Manual Installations

Some tools may need manual installation:

- **Rancher Desktop**: Download from https://rancherdesktop.io/
- **Bun**: `curl -fsSL https://bun.sh/install | bash`

## ✅ Quick Checklist

Use this checklist to ensure everything is set up correctly:

- [ ] Homebrew installed
- [ ] Packages installed (`bash install-brewfile.sh`)
- [ ] Terminal autocompletion configured (`bash configure-zsh-autocomplete.sh`)
- [ ] Terminal restarted
- [ ] Tab completion tested (`cd <Tab>` should show fuzzy menu)
- [ ] Git pager configured (optional, `bash configure-delta.sh`)
- [ ] Verify key tools: `zsh --version`, `fzf --version`, `git --version`, `node --version`, `python3 --version`

## 🎯 Best Practices

1. **Keep Brewfile in version control** - Track your development environment
2. **Run scripts from the directory** - Ensures correct paths
3. **Review before installing** - Check the Brewfile to see what will be installed
4. **Update regularly** - Keep your tools up to date for security and features
5. **Configure autocompletion** - Run `configure-zsh-autocomplete.sh` for enhanced terminal experience
6. **Configure delta** - Run `configure-delta.sh` after installation for better git diffs

## 🎉 You're All Set!

Your Mac development environment is now configured with:
- ✅ All development tools installed
- ✅ Enhanced terminal autocompletion
- ✅ Modern CLI tools
- ✅ Package managers and version managers
- ✅ Code editors and productivity tools

Happy coding! 🚀

---

**Note**: These scripts are designed to be safe and repeatable. You can run them multiple times without issues.
