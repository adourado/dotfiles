# AGENTS.md

## Repository Overview

This is a dotfiles repository containing Waybar configuration files. Waybar is a highly customizable Wayland status bar that uses JSONC for configuration and CSS for styling.

## Build/Lint/Test Commands

This repository contains configuration files only and does not use build systems, linters, or automated tests. Changes are applied immediately:

- Waybar automatically reloads configuration when `reload_style_on_change` is set to `true`
- To manually reload Waybar: `killall -SIGUSR2 waybar`
- To restart Waybar: `killall waybar && waybar &`

## Code Style Guidelines

### JSONC Configuration (`config.jsonc`)

**Formatting:**
- Use JSONC (JSON with comments) - comments are single-line `//`
- Use 2-space indentation
- Place comments above the configuration they describe
- Keep module configurations grouped by position (left/center/right)

**Naming Conventions:**
- Module names: kebab-case (e.g., `custom/power`, `battery#bat2`)
- Custom modules: use `custom/` prefix (e.g., `custom/media`, `custom/power`)
- Multiple instances of same module: use `#` suffix (e.g., `battery#bat2`)

**Module Configuration:**
- Order modules logically: system status → media → workspaces → indicators → clock
- Provide clear format strings with icons
- Include tooltip configurations for complex modules
- Set appropriate intervals for polling modules (typically 1-5 seconds)

**Custom Scripts:**
- Custom modules should use `$HOME/.config/waybar/` prefix for script paths
- Scripts should output JSON if `return-type: "json"` is set
- Always redirect stderr: `2> /dev/null` to prevent errors in bar

**Icon Usage:**
- Use Nerd Font or Font Awesome icons
- Consistent icon mapping across states (active/inactive/urgent/locked)
- Provide fallback icons for default cases

### CSS Styling (`style.css`)

**Formatting:**
- Use 4-space indentation
- Group selectors logically (base → modules → states)
- Separate major sections with blank lines
- Keep color definitions consistent using hex format (`#RRGGBB` or `#RRGGBBAA`)

**Selector Naming:**
- Module selectors: `#module-name` (e.g., `#battery`, `#cpu`, `#network`)
- State selectors: chained (e.g., `#battery.charging`, `#battery.critical`)
- Workspace selectors: `#workspaces button.focused`, `#workspaces button.urgent`

**Color Scheme:**
- Background: rgba colors with alpha for transparency (e.g., `rgba(43, 48, 59, 0.5)`)
- Text colors: high contrast with backgrounds
- Status colors:
  - Success/Green: `#2ecc71`, `#26A65B`
  - Warning/Orange: `#f0932b`, `#ffa000`
  - Critical/Red: `#f53c3c`, `#eb4d4b`
  - Info/Blue: `#2980b9`, `#0069d4`

**Module Styling:**
- Padding: `0 10px` for most modules
- Use `background-color` for module backgrounds
- Use `color` for text color
- Add hover effects using `:hover` pseudo-class

**Animations:**
- Use keyframes for blink animations (e.g., critical battery)
- Prefer `steps()` timing function to limit CPU usage
- Keep animation duration short (0.5s) and iteration count infinite

**Special Effects:**
- Use `box-shadow` instead of `border` for hover states to avoid text offset
- Use `transition-property` for smooth state changes
- Use `@keyframes` for animations

**Module-Specific Guidelines:**

- **Workspaces**: Use minimal padding, distinct active/urgent colors
- **Battery**: Add critical blink animation, charging indicator
- **CPU/Memory**: Green/Purple backgrounds, percentage-based
- **Network**: Different colors for connected/disconnected states
- **Audio**: Muted state should have different background
- **Temperature**: Critical threshold background change at 80°C
- **Tray**: Dim passive icons, highlight needs-attention

## Error Handling

- Suppress script errors in custom modules using `2> /dev/null`
- Provide fallback/disconnected formats for network and media modules
- Use state-based formatting (e.g., `format-disconnected`, `format-stopped`)

## Dependencies

- Waybar with Hyprland support
- Font Awesome or Nerd Fonts for icons
- Required system services: mpd, pulseaudio/wireplumber, power-profiles-daemon

## Testing Configuration

1. Verify JSONC syntax: Ensure no syntax errors before applying
2. Test custom scripts manually to verify output format
3. Check CSS syntax: Waybar will ignore invalid rules but won't error
4. Monitor `waybar` output: `journalctl -u waybar -f` for runtime errors

## Common Modifications

- Add new modules to `modules-left`, `modules-center`, or `modules-right` arrays
- Modify format strings to change displayed information
- Add CSS selectors for new modules following naming conventions
- Adjust spacing using `margin` and `padding` properties
- Change icons by updating format-icons mappings
