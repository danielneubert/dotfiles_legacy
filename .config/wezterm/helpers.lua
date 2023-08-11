function StartLockscreen()
	return wezterm.action_callback(function(win, pane)
		wezterm.background_child_process({
			"shortcuts",
			"run",
			"Bildschirmschoner ein",
		})
	end)
end

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

function DisableKey()
	return wezterm.action.DisableDefaultAssignment
end

function SendKey(mod, key)
	return wezterm.action.SendKey({ key = key, mods = mod })
end
