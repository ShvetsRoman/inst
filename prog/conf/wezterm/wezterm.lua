-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "nord"
-- config.color_scheme = 'Catppuccin Frappe'

config.font = wezterm.font "JetBrainsMono Nerd Font"
config.font_size = 12.5

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 50

config.enable_tab_bar = false
-- config.window_decorations = "TITLE | RESIZE"

config.initial_rows = 30
config.initial_cols = 100

-- and finally, return the configuration to wezterm
return config
