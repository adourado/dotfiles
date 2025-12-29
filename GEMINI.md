# GEMINI.md

## Project Overview

This repository contains personal configuration files (dotfiles) for a cross-platform development environment (Linux and Windows). It manages configurations for shell, editors, terminal emulators, window managers, and input remapping tools.

The directory structure suggests the use of **GNU Stow** for symlinking configurations to the user's home directory.

## Directory Structure & Key Configurations

The repository is organized by tool, following a pattern compatible with GNU Stow (e.g., `tool/.config/tool/...`).

### Core Tools

*   **Shell:** `fish`
    *   Configuration: `fish/.config/fish/config.fish`
    *   Features: Uses `mise` for version management.
*   **Editor:** `nvim`
    *   Configuration: `nvim/.config/nvim/`
    *   Framework: **LazyVim** based setup.
*   **Terminal Multiplexer:** `tmux`
    *   Configuration: `tmux/.tmux.conf`
    *   Features: Uses **TPM** (Tmux Plugin Manager), Catppuccin theme, and Vim-like navigation (`h`, `j`, `k`, `l`). Includes `tmux-continuum` for session restoration.
*   **Input Remapper:** `kanata`
    *   Configuration: `kanata/my/kanata.kbd`
    *   Purpose: Advanced key remapping (e.g., dual-function keys, layers).
    *   Service: `kanata/kanata.service` (Systemd service for Linux).

### Terminals & Window Managers (Cross-Platform)

*   **WezTerm:** `wezterm/` (Configured with `pwsh.exe`, indicating Windows usage).
*   **Alacritty:** `alacritty/`
*   **i3:** `i3/` (Linux X11 Tiling WM).
*   **GlazeWM:** `glazewm/` (Windows Tiling WM).
*   **Waybar:** `waybar/` (Wayland Status Bar).
    *   **Note:** See `AGENTS.md` for detailed Waybar configuration/styling guidelines.

### Other configurations

*   `starship/`: Starship prompt configuration.
*   `powershell/`: Windows PowerShell profile.

## Usage & Installation

### Prerequisities

*   **GNU Stow:** Recommended for managing symlinks.
*   **Git:** For version control.
*   **Mise:** For environment management (referenced in fish config).

### Installation (Inferred)

To install a specific configuration (e.g., `fish`), navigate to the repository root and run:

```bash
stow fish
```

This will symlink the contents of the `fish` directory to the user's home directory, preserving the directory structure (e.g., `fish/.config/fish/config.fish` -> `~/.config/fish/config.fish`).

## Development Conventions

*   **Modular Configs:** Configurations are separated by application.
*   **Cross-Platform:** Contains distinct configs for Linux (i3, Waybar, Fish) and Windows (GlazeWM, PowerShell, WezTerm).
*   **Waybar Customization:** Waybar styling is heavily customized with CSS and JSONC, documented in `AGENTS.md`.
