# Changelog

All notable changes to this project will be documented in this file.

## [0.7.0] - 2026-03-23

### 🎉 Major Feature: Multi-Instance Management

**ClawNet now includes complete OpenClaw instance management capabilities!**

This release integrates the functionality of `multi-openclaw` into ClawNet, making it a unified management platform for OpenClaw instances.

### New Features

#### 📦 Instance Management (NEW)
- **Create instances**: `clawnet instance create <name>`
- **List instances**: `clawnet instance list`
- **Start gateway**: `clawnet instance start <name>`
- **Stop gateway**: `clawnet instance stop <name>`
- **Connect to ClawNet**: `clawnet instance connect <name>`
- **WeChat login**: `clawnet instance login <name>`

#### 🔌 RESTful API Endpoints
- `GET /instances` - List all instances
- `GET /instances/:name` - Get instance details
- `POST /instances` - Create new instance
- `POST /instances/:name/start` - Start instance
- `POST /instances/:name/stop` - Stop instance
- `POST /instances/:name/connect` - Connect to ClawNet

#### ⚙️ Instance Management Features
- Auto port calculation (19000-19099)
- Auto WeChat plugin installation
- Gateway process management
- Instance status monitoring
- WeChat login status tracking
- ClawNet connection management

### Architecture Changes

**Before:**
```
multi-openclaw (separate CLI) → Manage instances
clawnet (separate) → Node/Relation management
```

**After:**
```
clawnet (unified platform)
├── instance → Instance management
├── node → Node management
├── relation → Relation management
└── health → Health check
```

### New CLI

```bash
# Unified command structure
clawnet instance create <name>      # Create instance
clawnet instance list               # List all instances
clawnet instance start <name>       # Start gateway
clawnet instance stop <name>        # Stop gateway
clawnet instance connect <name>     # Connect to ClawNet
clawnet instance login <name>       # WeChat login
```

### Files Changed
- ✅ `src/instance-service.ts` - New instance management service
- ✅ `src/server.ts` - Added instance API endpoints
- ✅ `bin/clawnet-v2` - New unified CLI (will replace clawnet-ctl)
- ✅ `package.json` - Version bump to 0.7.0

### Breaking Changes
None - All existing commands remain compatible

### Migration Guide
If you were using `multi-openclaw`:
```bash
# Old command
multi-openclaw create test

# New command
clawnet instance create test
```

## [0.6.1] - 2026-03-23

### New Feature
- 🎮 **ClawNet CTL** - Modern TUI control interface (OpenCode-style)
  - `clawnet-ctl` command for enhanced visual experience
  - Status panel with real-time system metrics
  - Box-drawing UI with clear visual hierarchy
  - Grouped menu with icons and separators
  - Better Chinese character alignment

### UI Improvements
- ✅ Box borders using `┌─┐│├┤└┘` characters
- ✅ Status indicators (✓/✗) for success/failure states
- ✅ Section headers with emojis
- ✅ Proper CJK character width calculation
- ✅ Cleaner menu organization

### New Command
```bash
clawnet-ctl          # Launch modern TUI interface
npm run ctl          # Alternative via npm script
```

## [0.6.0] - 2026-03-20

### Major Changes
- 🎉 **Complete CLI overhaul** - Inspired by OpenClaw and OpenCode design
- 🎮 **Dual mode support** - Traditional CLI + Interactive CLI
- 📦 **Command grouping** - node/relation/config commands
- ⚡ **Global options** - --url, --token, --json, --no-color
- 🎨 **ASCII Art banner** - Professional look with figlet
- 🔧 **Configuration persistence** - Auto-save to ~/.clawnetrc

### New Commands
- `clawnet init` - Initialize configuration
- `clawnet quick` - Quick actions menu
- `clawnet docs` - Open documentation
- `clawnet config` - Configuration management
- `clawnet interactive` (alias: `i`) - Interactive mode

### Command Aliases
- `nodes` = `node`
- `node ls` = `node list`
- `node rm` = `node delete`
- `relations` = `relation`
- `relation ls` = `relation list`
- `i` = `interactive`

### Enhanced Features
- ✅ Colored output with chalk
- ✅ Progress spinners with ora
- ✅ Better error messages
- ✅ Confirmation dialogs
- ✅ JSON output support
- ✅ Grouped menus in interactive mode

### Dependencies
- figlet: ^1.7.0 (ASCII Art)

### Documentation
- CLI-UPGRADE.md - Detailed upgrade guide
- Updated CLI-GUIDE.md with new commands

### Breaking Changes
- Command structure changed to grouped format
- Old flat commands still work but deprecated

## [0.6.0] - 2026-03-20

### Added
- 🎉 **Major CLI overhaul**
  - Complete rewrite using Commander.js
  - Dual mode: Traditional CLI + Interactive CLI
  - Command grouping (node/relation/config)
  - Command aliases (nodes, ls, rm, i)
  - Global options (--url, --token, --json, --no-color)
  - ASCII Art banner with figlet
- 📚 **New documentation**
  - CLI-UPGRADE.md - CLI upgrade guide
  - WINDOWS_QUICKSTART.md - 1-minute Windows setup

### Improved
- ✅ **User Experience**
  - Better error messages
  - Progress spinners
  - Colored output
  - Configuration persistence
  - JSON output support
  - Better help text
  - Grouped menu in interactive mode

### Dependencies
- figlet: ^1.7.0 (ASCII Art)

### Changed
- **Breaking Change:** CLI commands have been reorganized. See [CLI-UPGRADE.md](CLI-## [0.5.3] - 2026-03-20

### Added
- 🎉 **Interactive CLI** (clawnet-interactive)
  - Menu-based user interface
  - Colored output with chalk
  - Progress spinners with ora
  - User-friendly prompts with inquirer
- 🔧 **Configuration management**
  - Auto-save configuration to ~/.clawnetrc
  - Cross-session persistence
- 📦 **Node export/import**
  - Export nodes to JSON
  - Import nodes in batch
- ⏱️ **Temporary relations (TTL) UI**
  - Interactive TTL creation
  - Expiration warnings
- 🎨 **Enhanced UX**
  - Node grouping by type
  - Colored status indicators
  - Confirmation dialogs
  - Progress feedback

### Dependencies
- chalk: ^4.1.2 (colored output)
- commander: ^12.0.0 (CLI framework)
- inquirer: ^9.2.0 (interactive prompts)
- ora: ^7.0.0 (progress spinners)

### Documentation
- Add CLI-GUIDE.md with detailed usage
- Update README with CLI tools section

### Fixed
- Improved error handling
- Better error messages

## [0.5.2] - 2026-03-20

### Fixed
- Package metadata corrections

## [0.5.1] - 2026-03-20

### Added
- 📝 **English documentation** (default language)
- 🇨🇳 **Chinese documentation** (README_CN.md)
- 📦 **npm badges** in README
- 🪟 **Windows installation guide** (INSTALL_WINDOWS.md)
- 🔗 **Features documentation** (FEATURES.md)

### Changed
- Repository URL: https://github.com/Bsheepcoder/ClawNet
- Default README language: English
- Improved package.json metadata

## [0.5.0] - 2026-03-20

### Added
- 🎉 **First npm release**
- 📦 Multi-platform adapters (WeChat, Telegram)
- 📦 Relation graph management
- 📦 Permission control system
- 📦 WebSocket real-time communication
- 📦 SQLite local storage
- 📦 Extensible plugin system
- 📦 CLI tools
- 📦 OpenClaw skill integration
- 📚 Complete README documentation
- 📚 MIT LICENSE
- 📚 CHANGELOG.md

### Security
- 🔒 Removed all sensitive credentials
- 🔒 Added .gitignore for user configs
- 🔒 Added .env.example templates
- 🔒 No hardcoded credentials

### Improvements
- 📝 Comprehensive documentation
- 📝 Clean codebase
- 📝 Easy to use API
- 📝 Full TypeScript support

### Technical Details
- ✅ 51 files included
- ✅ 130.9 KB unpacked size
- ✅ 33.0 KB package size
- ✅ Full TypeScript definitions
- ✅ MIT License

## [0.4.1] - 2026-03-17

### Fixed
- Bug fixes and performance improvements
- Minor UI improvements

## [0.4.0] - 2026-03-16

### Added
- WeChat integration
- Message storage
- Auto-reply feature

## [0.3.0] - 2026-03-14

### Added
- Initial MVP release
- Basic routing system
- Permission management
- Graph structure

---

## Release Links

- [v0.5.0](https://github.com/Bsheepcoder/ClawNet/releases/tag/v0.5.0) - First npm release
- [v0.4.1](https://github.com/Bsheepcoder/ClawNet/releases/tag/v0.4.1) - Bug fixes
- [v0.4.0](https://github.com/Bsheepcoder/ClawNet/releases/tag/v0.4.0) - WeChat integration
- [v0.3.0](https://github.com/Bsheepcoder/ClawNet/releases/tag/v0.3.0) - Initial release

---

**For more details, see the [GitHub Releases](https://github.com/Bsheepcoder/ClawNet/releases) page.**
