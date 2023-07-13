local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
local github_ok, github = pcall(require, "github-theme")

if not catppuccin_ok or not github_ok then
	return
end

-- Catppuccin Macchiato
function Catppucin()
	catppuccin.setup({
		flavour = "macchiato",
	})
	vim.cmd.colorscheme("catppuccin")

	print("Theme: Catppuccin Macchiato")
end

vim.api.nvim_create_user_command("Dark", function()
	Catppucin()
end, {})

-- GitHub Theme Light
function GitHubLight()
	github.setup({})
	vim.cmd.colorscheme("github_light")

	print("Theme: GitHub Light")
end

vim.api.nvim_create_user_command("Light", function()
	GitHubLight()
end, {})

-- Default Theme for start
Catppucin()
