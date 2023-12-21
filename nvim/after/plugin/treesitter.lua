local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_ok then
	return
end

parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})

parser_configs.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade",
}

treesitter.setup({
	ensure_installed = {
		"bash",
		"blade",
		"c",
		"cpp",
		"css",
		"dockerfile",
		"fish",
		"gitattributes",
		"gitignore",
		"help",
		"html",
		"http",
		"lua",
		"make",
		"php",
		"phpdoc",
		"scss",
		"typescript",
		"vim",
		"yaml",
	},
	ignore_install = {
		"help",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 50000,
	},
	tree_docs = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
