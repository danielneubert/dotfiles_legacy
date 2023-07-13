vim.cmd([[
    packadd packer.nvim
]])

return require("packer").startup(function(use)
	-- packer
	use({ "wbthomason/packer.nvim" })

	-- theme
	use({ "catppuccin/nvim", as = "catppuccin" }) -- theme of choice
	use({ "rose-pine/neovim", as = "rose-pine" }) -- not really sure which light theme I like
	use({ "cormacrelf/dark-notify" }) -- sync light/dark mode with the OS

	-- required for most plugins
	use({ "nvim-lua/plenary.nvim" })

	-- help for comments
	use({ "numToStr/Comment.nvim" })

	-- filetree sidebar
	use({ "nvim-tree/nvim-tree.lua" })

	-- startup tracker
	use({ "dstein64/vim-startuptime" })

	-- fuzzy finder for files
	-- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "camspiers/snap" })

	-- auto closing
	use({ "windwp/nvim-autopairs" }) -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- treesitter (syntax highlighting)
	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })

	-- autocompletion
	use({ "hrsh7th/nvim-cmp" }) -- completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- source for text in buffer
	use({ "hrsh7th/cmp-path" }) -- source for file system paths

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) -- snippet engine
	use({ "saadparwaiz1/cmp_luasnip" }) -- for autocompletion
	use({ "rafamadriz/friendly-snippets" }) -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use({ "williamboman/mason.nvim" }) -- in charge of managing lsp servers, linters & formatters
	use({ "williamboman/mason-lspconfig.nvim" }) -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use({ "hrsh7th/cmp-nvim-lsp" }) -- for autocompletion
	use({ "neovim/nvim-lspconfig" }) -- easily configure language servers

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- colors for lsp problems
	use({ "folke/lsp-colors.nvim" })

	-- copilot ftw
	use({ "zbirenbaum/copilot.lua" })

	-- terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })
end)
