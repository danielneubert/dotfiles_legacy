vim.g.barbar_auto_setup = false

local barbar_ok, barbar = pcall(require, "barbar")

if not barbar_ok then
	return
end

barbar.setup({
	animation = false,
	auto_hide = false,
	tabpages = false,
	clickable = true,
	focus_on_close = "left",
	icons = {
		filetype = {
			enabled = false,
		},
		buffer_index = true,
		buffer_number = false,
		separator = { left = "│", right = "" },
		separator_at_end = false,
		preset = "default",
		modified = { button = "•" },
		inactive = { button = "×", separator = { left = "│", right = "" } },
		current = { button = "×" },
		visible = { button = "×" },
	},
	insert_at_end = true,
	maximum_padding = 1,
	minimum_padding = 1,
	maximum_length = 40,
	minimum_length = 0,
	sidebar_filetypes = {
		-- NvimTree = true,
	},
	no_name_title = "[No Name]",
})
