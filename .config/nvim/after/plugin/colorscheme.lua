local rosepine_ok, rosepine = pcall(require, "rose-pine")
local github_ok, github = pcall(require, "github-theme")

if not rosepine_ok or not github_ok then
	return
end

-- ===============
-- Rose Pine Theme
-- ===============

-- Rose Pine Moon
function ColorRoseMoon()
	rosepine.setup({
		variant = "moon",
	})

	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "NonText", { fg = "#44415a" })

	print("Theme: Rose Pine Moon")
end

-- Rose Pine Dawn
function ColorRoseDawn()
	rosepine.setup({
		variant = "dawn",
	})

	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "NonText", { fg = "#dfdad9" })

	print("Theme: Rose Pine Dawn")
end

--

-- ======
-- GitHub
-- ======

-- GitHub Light
function ColorGitHub()
	github.setup({})

	vim.cmd.colorscheme("github_light")

	print("Theme: GitHub Light")
end

--

-- ========
-- Commands
-- ========
vim.api.nvim_create_user_command("Rose", function()
	ColorRoseMoon()
end, {})

vim.api.nvim_create_user_command("Day", function()
	ColorRoseDawn()
end, {})

vim.api.nvim_create_user_command("Sun", function()
	ColorGitHub()
end, {})

-- Default Theme for start
ColorRoseMoon()
