local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.default_prog = { 'nu' }
config.font = wezterm.font 'Fira Code'
config.font_size = 12

return config