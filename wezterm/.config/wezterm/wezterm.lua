-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = { 'pwsh.exe', '-NoLogo' }
-- For example, changing the color scheme:
--config.color_scheme = 'AdventureTime'
config.color_scheme = 'Gruvbox dark, medium (base16)'
-- and finally, return the configuration to wezterm
return config
