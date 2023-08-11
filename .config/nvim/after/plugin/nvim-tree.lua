vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	view = {
		cursorline = true,
		width = 40,
		side = "left",
		number = false,
		relativenumber = false,
		signcolumn = "no",
	},
	renderer = {
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none", -- none
		highlight_modified = "none",
		root_folder_label = false,
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = false,
			git_placement = "end",
			modified_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
			},
			glyphs = {
				default = "■",
				symlink = "◇",
				bookmark = "",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "●",
					staged = "◉",
					unmerged = "",
					renamed = "R",
					untracked = "●",
					deleted = "D",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		custom = {
			".DS_Store",
			".git",
			".gitattributes",
			".phpunit.cache",
			".php-cs-fixer.cache",
			".phpactor.json",
			"composer.lock",
			"node_modules",
			"package-lock.json",
		},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
	modified = {
		enable = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	trash = {
		cmd = "trash",
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	on_attach = function(treeBuffer)
		local api = require("nvim-tree.api")

		local remap = function(key, call, desc)
			vim.keymap.set("n", key, call, { buffer = treeBuffer, desc = desc })
		end

		remap("<C-e>", api.tree.close, "Close NvimTree")
		remap("<cr>", api.node.open.edit, "Open")
		remap("<2-LeftMouse>", api.node.open.edit, "Open")
		remap("sv", api.node.open.vertical, "Open in Vertical Split")
		remap("sc", api.node.open.horizontal, "Open in Horizontal Split")
		remap("d", api.fs.trash, "Trash")
		remap("D", api.fs.remove, "Delete")
		remap("a", api.fs.create, "Create")
		remap("y", api.fs.copy.node, "Copy")
		remap("p", api.fs.paste, "Paste")
		remap("r", api.fs.rename, "Rename")
		remap("R", api.tree.reload, "Reload")
		remap("K", api.node.navigate.parent, "Go to Parent")
		remap("x", api.fs.cut, "Cut")
		remap("Y", api.fs.copy.filename, "Copy: Filename")
		remap("F", api.live_filter.clear, "Clean Filter")
		remap("f", api.live_filter.start, "Filter")
		remap("s", api.tree.search_node, "Search")
		remap("?", api.tree.toggle_help, "Show Help")
		remap("gh", api.tree.toggle_custom_filter, "Toggle Hidden")
		remap("gd", api.tree.toggle_hidden_filter, "Toggle Dotfiles")
		remap("gg", api.tree.toggle_gitignore_filter, "Toggle Git Ignore")
		remap("W", api.tree.collapse_all, "Collapse All")
	end,
})
