# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Hyprland configuration repository for a Linux desktop environment setup. Hyprland is a dynamic tiling Wayland compositor that uses modular configuration files and shell scripts for customization and automation.

## Configuration Architecture

### Core Configuration Structure
- `hyprland.conf` - Main config file that sources all modular configs from `configs/` directory
- `configs/` - Modular configuration files:
  - `settings.conf` - Display, input, animations, decorations
  - `keybinds.conf` - Keyboard shortcuts and application launchers
  - `monitors.conf` - Display configuration
  - `workspaces.conf` - Workspace rules
  - `windows.conf` - Window rules and behavior
  - `env.conf` - Environment variables
  - `startup.conf` - Auto-start applications
  - `laptop.conf` - Laptop-specific settings

### Scripts Organization
Scripts are organized by function in `scripts/` directory:
- `system/` - System operations (lock, refresh, autostart, process management)
- `theme/` - Wallpaper and theming (wallust integration, blur effects, color schemes)
- `settings/` - Configuration utilities (layout switching, clipboard)
- `utils/` - User utilities (screenshots, media controls)
- Root level scripts for hardware controls (brightness, volume, touchpad)

### Configuration Synchronization
- `config-sync.sh` - Interactive menu for syncing external configs (rofi, waybar, kitty, wallust, GTK themes)
- `cs.sh` - Automated sync based on modification timestamps for multiple config directories
- `.configs/` directory - External configuration storage for syncing

## Key Technologies & Dependencies

- **Hyprland** - Wayland compositor
- **swww** - Wallpaper daemon for smooth transitions
- **wallust** - Color scheme generation from wallpapers
- **rofi** - Application launcher and menu system
- **waybar** - Status bar
- **kitty** - Terminal emulator
- **hyprshade** - Screen shader effects (vibrance, blue light filter)
- **notify-send** - Desktop notifications

## Common Development Tasks

### Testing Configuration Changes
After modifying config files, refresh Hyprland:
```bash
./scripts/system/refresh.sh
```

### Wallpaper System
- Wallpapers stored in `~/Pictures/wallpapers`
- `scripts/theme/wallpaper-select.sh` - Interactive wallpaper selection with rofi
- `scripts/theme/wallpaper-colors.sh` - Generate color schemes from wallpapers using wallust
- Colors are applied to `wallust/wallust-hyprland.conf` and sourced by main config

### Configuration Sync Commands
```bash
# Interactive sync menu
./config-sync.sh

# Automated sync based on timestamps
./cs.sh
```

### Key Bindings System
- `$mod = ALT` (primary modifier)
- `$super = SUPER` (secondary modifier)
- Colemak keyboard layout configured
- Applications defined as variables at top of keybinds.conf
- Uses key codes for workspace switching to support multiple keyboard layouts

## Script Patterns

### Wallpaper Scripts
- Use `swww` for smooth wallpaper transitions
- Always check/kill existing `swaybg` processes
- Call `wallpaper-colors.sh` after wallpaper changes
- Follow with `refresh.sh` to apply theme changes

### Rofi Integration
- Scripts use rofi for interactive selection menus
- Custom rofi configs for different purposes (wallpaper selection, etc.)
- Always check for existing rofi processes and kill before launching

### Notification Pattern
Most user-facing operations include `notify-send` feedback for status updates.

## File Editing Guidelines

### Configuration Files
- Settings are organized by function across multiple .conf files
- Colors use wallust variables (e.g., `$color12`, `$color15`)
- Maintain modular structure - avoid putting everything in one file

### Shell Scripts
- Use `#!/bin/bash` shebang
- Include descriptive comments for complex operations
- Use proper variable quoting for paths with spaces
- Follow existing patterns for rofi integration and notifications

### Keybind Modifications
- Use key codes for numbers (code:10-19 for 1-0) to support international layouts
- Define application variables at top of keybinds.conf
- Group related bindings with comments
- Test with current Colemak layout (n=left, i=right, u=up, e=down)