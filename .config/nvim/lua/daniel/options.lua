-- Cursor
vim.opt.scrolloff = 8
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

-- Window Title
vim.opt.title = true
vim.opt.titlestring = "vim %{substitute(getcwd(), $HOME, '~', '')}"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

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
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Vim Is Awesome
vim.opt.backspace = "indent,eol,start"

-- Window Management
vim.opt.splitbelow = false
vim.opt.splitright = true

-- Color Setup
vim.opt.termguicolors = true

-- PHP word seperation to select $this
vim.opt.iskeyword:append("$")

-- Highlight invisible chars
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

-- Disable BarBar Auto Setup (don't ask me why)
vim.g.barbar_auto_setup = false
