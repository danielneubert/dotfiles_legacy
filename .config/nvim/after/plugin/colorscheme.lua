local rosepine_ok, rosepine = pcall(require, "rose-pine")
local github_ok, github = pcall(require, "github-theme")
local tokyo_ok, tokyo = pcall(require, "tokyonight")

if not rosepine_ok or not github_ok or not tokyo_ok then
	return
end

-- ===============
-- Rose Pine Theme
-- ===============

-- Rose Pine Moon
function ColorRoseMoon()
	rosepine.setup({
		variant = "moon",
	})

	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "NonText", { fg = "#44415a" })

	print("Theme: Rose Pine Moon")
end

-- Rose Pine Dawn
function ColorRoseDawn()
	rosepine.setup({
		variant = "dawn",
	})

	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "NonText", { fg = "#dfdad9" })

	print("Theme: Rose Pine Dawn")
end

--

-- ======
-- GitHub
-- ======

-- GitHub Light
function ColorGitHub()
	github.setup({})

	vim.cmd.colorscheme("github_light")

	print("Theme: GitHub Light")
end

--

-- ==========
-- Tokyo Moon
-- ==========

-- Tokyo
function ColorTokyo()
	tokyo.setup({
		style = "moon",
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "dark",
			floats = "dark",
		},
		sidebars = { "NvimTree", "help" },
	})

	vim.cmd.colorscheme("tokyonight")

	print("Theme: Tokyo")
end

--

-- ========
-- Commands
-- ========
vim.api.nvim_create_user_command("Rose", function()
	ColorRoseMoon()
end, {})

vim.api.nvim_create_user_command("Day", function()
	ColorRoseDawn()
end, {})

vim.api.nvim_create_user_command("Sun", function()
	ColorGitHub()
end, {})

vim.api.nvim_create_user_command("Tokyo", function()
	ColorTokyo()
end, {})

-- Default Theme for start
ColorTokyo()
