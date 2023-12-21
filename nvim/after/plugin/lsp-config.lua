local lsp_ok, lsp = pcall(require, "lspconfig")
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")

if not lsp_ok or not cmp_ok then
	return
end

local capabilities = cmp.default_capabilities()
local on_attach = function(client, bufnr)
	local function keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
	keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
end

local default_config = {
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.loop.cwd()
	end,
}

lsp.tsserver.setup(default_config)
lsp.cssls.setup(default_config)
lsp.tailwindcss.setup(default_config)
--
-- lsp.intelephense.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	root_dir = function()
-- 		return vim.loop.cwd()
-- 	end,
-- 	settings = {
-- 		intelephense = {
-- 			files = {
-- 				associations = {
-- 					"*.php",
-- 					"*.phtml",
-- 					"*.module",
-- 					"*.inc",
-- 				},
-- 			},
-- 		},
-- 	},
-- })

lsp.phpactor.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function()
		return vim.loop.cwd()
	end,
	-- settings = {
	-- 	intelephense = {
	-- 		files = {
	-- 			associations = {
	-- 				"*.php",
	-- 				"*.phtml",
	-- 				"*.module",
	-- 				"*.inc",
	-- 			},
	-- 		},
	-- 	},
	-- },
})

local path = lsp.util.path
local volar_path = path.join(vim.fn.stdpath("data"), "lsp_servers", "volar", "node_modules")
local global_ts_server_path = path.join(volar_path, "typescript", "lib")

local function get_typescript_lib_path(root_dir)
	local project_root = util.find_node_modules_ancestor(root_dir)
	return project_root and (path.join(project_root, "node_modules", "typescript", "lib")) or global_ts_server_path
end

lsp.volar.setup({
	init_options = {
		typescript = {
			tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
		},
	},
	on_new_config = function(new_config, new_root_dir)
		new_config.init_options.typescript.tsdk = get_typescript_lib_path(new_root_dir)
	end,
	capabilities = cmp_capabilities,
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	settings = {
		volar = { autoCompleteRefs = true },
	},
})

lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim", -- Support the global vim object
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
})

vim.diagnostic.config({
	float = {
		source = "always", -- Or "if_many"
	},
	update_in_insert = true,
	virtual_text = {
		prefix = "●",
	},
})
