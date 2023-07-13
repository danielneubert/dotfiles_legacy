local dark_mode_ok, dark_mode = pcall(require, "dark_notify")
local rose_pine_ok, rose_pine = pcall(require, "rose-pine")
local catppuccin_ok, catppuccin = pcall(require, "catppuccin")

if not dark_mode_ok or not rose_pine_ok then
	return
end

-- Catppuccin Macchiato
function Cat()
	catppuccin.setup({
		flavour = "macchiato", -- latte, frappe, macchiato, mocha
	})
	vim.cmd.colorscheme("catppuccin")

	print("Theme: Catppuccin Macchiato")
end

-- Catppuccin Latte
function Latte()
	catppuccin.setup({
		flavour = "latte", -- latte, frappe, macchiato, mocha
	})
	vim.cmd.colorscheme("catppuccin")

	print("Theme: Catppuccin Latte")
end

-- Rose Pine Dawn
function Rose()
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

-- Dark Mode / Light Mode
dark_mode.run({
	onchange = function(mode)
		if mode == "light" then
			Latte()
		else
			Cat()
		end
	end,
})
