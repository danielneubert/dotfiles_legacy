local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.phpcsfixer.with({ -- Change how the php linting will work
			prefer_local = "vendor/bin",
		}),
		formatting.stylua,
	},
})
