-- Cursor
vim.opt.scrolloff = 8
vim.opt.guicursor = ""
vim.opt.cursorline = false
vim.opt.colorcolumn = "80"

-- Window Title
vim.opt.title = true
vim.opt.titlestring = "vim %{substitute(getcwd(), $HOME, '~', '')}"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = true

-- File Encoding
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Vim Is Awesome
vim.opt.swapfile = false
vim.opt.backspace = "indent,eol,start"

-- Window Management
vim.opt.splitbelow = false
vim.opt.splitright = true

-- Color Setup
vim.opt.termguicolors = true

-- Color Setup
vim.opt.foldenable = false

-- PHP word seperation to select $this
vim.opt.iskeyword:append("$")

-- Highlight invisible chars
vim.opt.list = false
vim.opt.listchars:append("space:⋅")

-- Disable BarBar Auto Setup (don't ask me why)
vim.g.barbar_auto_setup = false
