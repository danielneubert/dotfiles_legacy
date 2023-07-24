local rose_pine_ok, rose_pine = pcall(require, "rose-pine")
local github_ok, github = pcall(require, "github-theme")

if not rose_pine_ok or not github_ok then
	return
end

-- Rose Pine Moon
function Rose()
	rose_pine.setup({
		variant = "moon",
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = true,
	})

	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "NonText", { fg = "#44415a" })

	print("Theme: Rose Pine Moon")
end

vim.api.nvim_create_user_command("Dark", function()
	Rose()
end, {})

-- Rose Pine Dawn
function RoseDawn()
	rose_pine.setup({
		variant = "dawn",
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = true,
	})

	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "NonText", { fg = "#dfdad9" })
	print("Theme: Rose Pine Dawn")
end

vim.api.nvim_create_user_command("Light", function()
	RoseDawn()
end, {})

-- GitHub (Wenn the sun hits hard)
function GitHub()
	github.setup({})
	vim.cmd.colorscheme("github_light")

	print("Theme: GitHub Light")
end

vim.api.nvim_create_user_command("Sun", function()
	GitHub()
end, {})
--
-- Default Theme for start
Rose()
