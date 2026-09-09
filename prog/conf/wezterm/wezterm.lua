-- Pull in the wezterm API
local wezterm = require "wezterm"
local act = wezterm.action

-- This will hold the configuration.
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
   wezterm.config_builder()
end

config.enable_wayland = true

-- Settings
config.xcursor_theme = "capitaine-cursors"

-- config.color_scheme = "nord"
-- config.color_scheme = 'DotGov'
-- config.color_scheme = 'Hardcore'
config.color_scheme = 'Vs Code Dark+ (Gogh)'

-- config.font = wezterm.font "JetBrainsMono Nerd Font"
config.font = wezterm.font "FiraCode Nerd Font"
config.font_size = 16
config.window_background_opacity = 0.99
-- config.kde_window_background_blur = true
-- config.line_height = 1.2

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 50
config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
-- config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

config.initial_rows = 35
config.initial_cols = 105
-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- and finally, return the configuration to wezterm
return config
