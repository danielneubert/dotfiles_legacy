-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration
local config = {}

-- Populate the configuration
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Changing the cursor to something you'll see everywhere
config.colors = {
	cursor_bg = "#F00045",
	cursor_fg = "black",
	cursor_border = "#F00045",
}

-- Change the colorscheme
config.color_scheme = "TokyoNight"

-- Make the window perfect
config.enable_tab_bar = false
config.window_background_opacity = 0.85
config.macos_window_background_blur = 32
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Change the font to something workable
config.font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Medium" })
config.font_size = 18

-- Say that this macOS app works as a macOS app ...
config.native_macos_fullscreen_mode = true

-- Some keybindings for a better everyday use of vim
config.keys = {
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "q",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "f",
		mods = "CMD|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "s", mods = "CTRL" }),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "l", mods = "CTRL" }),
	},
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "t", mods = "CTRL" }),
	},
	{
		key = "e",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "e", mods = "CTRL" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }),
	},
	{
		key = "f",
		mods = "CMD|SHIFT",
		action = wezterm.action.SendKey({ key = "f", mods = "CTRL" }),
	},
	{
		key = "c",
		mods = "CMD|SHIFT",
		action = wezterm.action.SendKey({ key = "c", mods = "CTRL" }),
	},
}

-- and finally, return the configuration to wezterm
return config
