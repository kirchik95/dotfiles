-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Frappe"
config.dpi = 144
config.font_size = 16
config.font = wezterm.font_with_fallback({
	family = "JetBrainsMono Nerd Font",
	weight = "Medium",
	italic = false,
})
config.line_height = 0.95
config.use_cap_height_to_scale_fallback_fonts = true
config.window_padding = { left = 10, right = 10, top = 10, bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.macos_window_background_blur = 15
config.force_reverse_video_cursor = true
config.adjust_window_size_when_changing_font_size = false

return config
