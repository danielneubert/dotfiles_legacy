local dark_mode_ok, dark_mode = pcall(require, "dark_notify")
local rose_pine_ok, rose_pine = pcall(require, "rose-pine")
local tokyonight_ok, tokyonight = pcall(require, "tokyonight")
local onedark_ok, onedark = pcall(require, "onedark")

if not dark_mode_ok or not rose_pine_ok or not tokyonight_ok then
	return
end

-- Rose Pine / Variant: Moon
function ColorRosePineMoon()
	rose_pine.setup({
		variant = "moon",
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = true,
	})

	vim.cmd.colorscheme("rose-pine")
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NonText", { fg = "#44415a" })
	print("Theme: Rose Pine Moon")
end

-- Rose Pine / Variant: Dawn
function ColorRosePineDawn()
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

-- Tokyo Night / Variant: Moon
function ColorTokyo()
	tokyonight.setup({
		style = "moon",
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		sidebars = { "qf", "help", "NvimTree" },
	})
	--
	vim.cmd.colorscheme("tokyonight-moon")
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NonText", { fg = "#44415a" })
	print("Theme: Tokyo Night Moon")
end

-- Tokyo Night / Variant: Day
function ColorTokyoDay()
	tokyonight.setup({
		style = "day",
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		sidebars = { "qf", "help", "NvimTree" },
	})
	--
	vim.cmd.colorscheme("tokyonight-day")
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NonText", { fg = "#44415a" })
	print("Theme: Tokyo Night Day")
end

-- One Dark
function ColorOneDark()
	require("onedark").setup({
		style = "day",
	})
	require("onedark").load()

	print("Theme: One Dark")
end

-- Catppuccin
function ColorCat()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
	})
	vim.cmd.colorscheme("catppuccin")

	print("Theme: One Dark")
end

ColorTokyo()

-- Dark Mode / Light Mode
-- dark_mode.run({
-- 	onchange = function(mode)
-- 		if mode == "light" then
-- 			ColorOneDark()
-- 		else
-- 			ColorOneDark()
-- 		end
-- 	end,
-- })
