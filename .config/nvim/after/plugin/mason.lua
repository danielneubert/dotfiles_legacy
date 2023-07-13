local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

mason.setup({})

mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"html",
		"intelephense",
		"jsonls",
		"lua_ls",
		"tailwindcss",
		"tsserver",
		"volar",
		"yamlls",
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"php-cs",
		"php-cs-fixer",
		"stylua",
	},
})
