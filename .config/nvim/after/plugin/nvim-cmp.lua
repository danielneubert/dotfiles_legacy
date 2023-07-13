local cmp = require("cmp")
local luasnip = require("luasnip")

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<M-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<M-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<M-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<Enter>"] = cmp.mapping.confirm({
			select = true,
		}),
		["<Tab>"] = cmp.mapping.confirm({
			select = true,
		}),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp", order = "1" }, -- lsp
		{ name = "luasnip", order = "2" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
})
