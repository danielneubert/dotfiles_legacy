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
config.color_scheme = "Rosé Pine Moon (Gogh)"

-- Make the window perfect
config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 64
config.exit_behavior = "CloseOnCleanExit"
config.window_padding = {
	left = 0,
	right = 0,
	top = 2,
	bottom = 0,
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 300
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Run the fish shell by default
-- This will enable to have the default zsh shell on the macos terminal for fallback cases
config.default_prog = { "/opt/homebrew/bin/fish" }

-- -- Change the font to something workable
config.font = wezterm.font("JetBrains Mono", { weight = "DemiBold" })
config.font_size = 16
config.line_height = 1.2

-- Say that this macOS app works as a macOS app ...
config.native_macos_fullscreen_mode = true

-- start the macos screensaver and lockscreen via the shortcuts app
function StartLockscreen()
	return wezterm.action_callback(function(win, pane)
		wezterm.background_child_process({
			"shortcuts",
			"run",
			"Bildschirmschoner ein",
		})
	end)
end

-- define keybindings
function Keybind(mod, key, action)
	if config.keys == nil then
		config.keys = {}
	end

	config.keys[#config.keys + 1] = {
		key = key,
		mods = mod,
		action = action,
	}
end

-- disable the given keybinding and pass it down
function DisableKey()
	return wezterm.action.DisableDefaultAssignment
end

-- send the given keybinding
function SendKey(mod, key)
	return wezterm.action.SendKey({ key = key, mods = mod })
end

-- disable some default bindings (to pass them down)
Keybind("CMD", "h", DisableKey())
Keybind("CMD", "m", DisableKey())
Keybind("CMD", "w", DisableKey())
Keybind("CTRL", "n", DisableKey())
Keybind("CTRL", "w", DisableKey())
Keybind("CTRL|SHIFT", "j", DisableKey())
Keybind("CTRL|SHIFT", "k", DisableKey())

-- system bindings
Keybind("CMD", "F3", StartLockscreen())
Keybind("CMD", "F16", StartLockscreen())
Keybind("CMD", "q", wezterm.action.CloseCurrentTab({ confirm = true }))
Keybind("CMD|CTRL", "f", wezterm.action.ToggleFullScreen)

-- tmux bindings
Keybind("CMD", "t", SendKey("CTRL", "F6"))
Keybind("CMD|SHIFT", "w", SendKey("CTRL", "F7"))
Keybind("CMD", "h", SendKey("CTRL", "F8"))
Keybind("CMD", "l", SendKey("CTRL", "F9"))
Keybind("CMD", "1", SendKey("CTRL", "F1"))
Keybind("CMD", "2", SendKey("CTRL", "F2"))
Keybind("CMD", "3", SendKey("CTRL", "F3"))
Keybind("CMD", "4", SendKey("CTRL", "F4"))
Keybind("CMD", "5", SendKey("CTRL", "F5"))

-- vim bindings
Keybind("CMD", "e", SendKey("CTRL", "e")) -- open file explorer
Keybind("CMD", "f", SendKey("CTRL", "p")) -- find file
Keybind("CMD", "s", SendKey("CTRL", "s")) -- save file
Keybind("CMD|SHIFT", "f", SendKey("CTRL", "f")) -- find filecontent
Keybind("CMD|SHIFT", "c", SendKey("CTRL", "c")) -- copy vim selection to system clipboard

-- and finally, return the configuration to wezterm
return config
