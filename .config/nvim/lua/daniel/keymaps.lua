vim.g.mapleader = " "

--------------------
-- Handy Helpers
--------------------

-- indent in normal mode without double-press
vim.keymap.set("n", "<", "<<", { noremap = true, silent = true })
vim.keymap.set("n", ">", ">>", { noremap = true, silent = true })

-- indent in visual mode without loosing selection
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- move cursor up/down within wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj", { silent = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { silent = true })

-- move selection up/down with correct indention
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

-- clear the highlighted search results
vim.keymap.set("n", "<leader>h", "<cmd>nohl<cr>")

-- delete a single char without moving it to the copy-paste buffer
vim.keymap.set("n", "x", '"_x')

-- open the vim explorer
vim.keymap.set("n", "<leader>px", "<cmd>Ex<cr>")

-- sort selection by name
vim.keymap.set("v", "<leader>soo", ":sort<cr>")

-- sort selection by line length
vim.keymap.set("v", "<leader>sol", ':! awk \'{ print length(), $0 | "sort -n | cut -d\\" \\" -f2-" }\'<cr>')

-- replace the word of the cursor position in this file
vim.keymap.set("n", "<leader>rr", [[:.s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>rg", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/cgI<Left><Left><Left>]])

-- enable <CMD-S> to save the file in iTerm via <C-w>
vim.keymap.set({ "n", "v" }, "<D-s>", function()
	vim.lsp.buf.format()
	vim.cmd("w")
end)
vim.keymap.set({ "n", "v" }, "<C-s>", function()
	vim.lsp.buf.format()
	vim.cmd("w")
end)
vim.keymap.set({ "n", "v" }, "<M-#>", "gcc")
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p')
vim.keymap.set("v", "<C-x>", '"+x')

--------------------
-- Split
--------------------
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split vertical
vim.keymap.set("n", "<leader>sc", "<C-w>s") -- split vertical
vim.keymap.set("n", "<leader>se", "<C-w>=") -- re-align splits
vim.keymap.set("n", "<leader>sw", "<cmd>close<cr>") -- close active split
vim.keymap.set("n", "<M-w>", "<cmd>close<cr>") -- close active split
vim.keymap.set("n", "<M-h>", "<C-w>h") -- move cursor next split
vim.keymap.set("n", "<M-l>", "<C-w>l") -- move cursor prev split
vim.keymap.set("n", "<M-j>", "<C-w>j") -- move cursor next split
vim.keymap.set("n", "<M-k>", "<C-w>k") -- move cursor prev split

--------------------
-- Tabs
--------------------
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<cr>") -- create new tab
vim.keymap.set("n", "<leader>tw", "<cmd>tabclose<cr>") -- close current tab
-- vim.keymap.set("n", "<M-l>", "<cmd>tabn<cr>") -- go to next tab
-- vim.keymap.set("n", "<M-h>", "<cmd>tabp<cr>") -- go to previous tab

--------------------
-- Plugin: NvimTree
--------------------
vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<cr>") -- open the nvim tree (mapped in iTerm to CMD-E)
vim.keymap.set("n", "<D-e>", "<cmd>NvimTreeToggle<cr>") -- open the nvim tree (mapped in iTerm to CMD-E)

--------------------
-- Plugin: Telescope
--------------------
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
