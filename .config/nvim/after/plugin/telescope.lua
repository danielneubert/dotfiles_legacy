local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-l>", builtin.find_files, {})
vim.keymap.set("n", "<D-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"%.cache",
			"%.class",
			"%.dll",
			"%.docx",
			"%.dylib",
			"%.exe",
			"%.ico",
			"%.ipynb",
			"%.jar",
			"%.jpeg",
			"%.jpg",
			"%.lock",
			"%.met",
			"%.otf",
			"%.pdb",
			"%.pdf",
			"%.png",
			"%.sqlite3",
			"%.svg",
			"%.ttf",
			"%.webp",
			".DS_Store",
			".dart_tool/",
			".git/",
			".git/*",
			".github/",
			".gradle/",
			".idea/",
			".vale/",
			".vscode/",
			"__pycache__/",
			"__pycache__/*",
			"build/",
			"env/",
			"gradle/",
			"node%_modules/*",
			"public/js/*",
			"public/css/*",
			"node%_modules/*",
			"smalljre_*/*",
			"target/",
			"storage/*",
			"vendor/*",
		},
		mappings = {
			i = {
				["<M-j>"] = actions.move_selection_next,
				["<M-k>"] = actions.move_selection_previous,
				["<Esc>"] = actions.close,
				["<C-p>"] = actions.close,
				["<D-p>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
			hidden = true,
		},
		git_files = {
			theme = "dropdown",
			previewer = false,
		},
		live_grep = {
			theme = "ivy",
			previewer = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "ignore_case",
		},
	},
})
