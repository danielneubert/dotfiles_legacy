local copilot_ok, copilot = pcall(require, "copilot")

if not copilot_ok then
	return
end

copilot.setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 100,
		keymap = {
			-- Autocomplete Copilot with <Option-Tab>
			accept = "<M-Tab>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
})
