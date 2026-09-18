-- WEZTERM — ОСНОВНИЙ КОНФІГ
local wezterm = require "wezterm"

local config = wezterm.config_builder()

-- WAYLAND
config.enable_wayland = true
config.xcursor_theme = "capitaine-cursors"


-- ЗОВНІШНІЙ ВИГЛЯД
local appearance = require "appearance"

for key, value in pairs(appearance) do
    if key ~= "format_tab_title" then
        config[key] = value
    end
end

wezterm.on("format-tab-title", appearance.format_tab_title)

-- WINDOW
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.initial_rows = 35
config.initial_cols = 105

config.scrollback_lines = 3000
config.default_workspace = "home"

-- PANELS
config.inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5,
}

-- PERFORMANCE
config.front_end = "WebGpu"
config.max_fps = 120
config.animation_fps = 120

-- KEYMAPS
config.keys = require "keymaps"

return config
