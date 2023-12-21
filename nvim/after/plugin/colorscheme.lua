local rosepine_ok, rosepine = pcall(require, "rose-pine")
local github_ok, github = pcall(require, "github-theme")
local cat_ok, cat = pcall(require, "catppuccin")
local dark_ok, dark = pcall(require, "dark_notify")
local sol_ok, sol = pcall(require, "solarized-osaka")

if not rosepine_ok or not github_ok or not cat_ok or not dark_ok or not sol_ok then
	return
end

-- ===============
-- Rose Pine Theme
-- ===============

-- Rose Pine Moon
function ColorRoseMoon()
	rosepine.setup({
		variant = "moon",
		disable_background = true,
		disable_float_background = false,
		disable_italics = true,
		highlight_groups = {
			Comment = { italic = true },
			String = { italic = true },
		},
	})

	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "NonText", { fg = "#44415a" })

	print("Theme: Rose Pine Moon")
end

-- Rose Pine Dawn
function ColorRoseDawn()
	rosepine.setup({
		variant = "dawn",
		-- disable_background = true,
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

-- =========
-- Catpuccin
-- =========

-- Cat Macchiatto
function ColorCat()
	cat.setup({
		flavour = "macchiato",
		transparent_background = true,
		show_end_of_buffer = true,
	})

	vim.cmd.colorscheme("catppuccin")

	print("Theme: Catppuccin (Macchiato)")
end

-- =========
-- Solarized
-- =========

-- Cat Macchiatto
function ColorSol()
	sol.setup({
		transparent = false, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
		style = "dark",
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = { bold = true },
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		sidebars = { "qf", "help", "nvim-tree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
		day_brightness = 0, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		dim_inactive = false, -- dims inactive windows
		lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
	})

	vim.cmd.colorscheme("solarized-osaka-moon")

	print("Theme: Solarized Osaka")
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

vim.api.nvim_create_user_command("Cat", function()
	ColorCat()
end, {})

vim.api.nvim_create_user_command("Sol", function()
	ColorSol()
end, {})

--

-- =========
-- Dark Mode
-- =========
dark.run({
	onchange = function(mode)
		if mode == "light" then
			ColorRoseMoon()
		else
			ColorRoseMoon()
		end
	end,
})

-- Default Theme for start
ColorCat()
