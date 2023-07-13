require("toggleterm").setup({
	open_mapping = [[<C-T>]],
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	float_opts = {
		border = "curved",
	},
})
