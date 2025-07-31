-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Custom timing settings
opt.updatetime = 250
opt.timeoutlen = 400

opt.hlsearch = false
opt.incsearch = true

-- Scrolloff and fillchars
opt.scrolloff = 4
opt.fillchars = {
	eob = " ", -- Empty lines at the end of buffer
	vert = " ", -- Vertical split separator
	horiz = " ", -- Horizontal split separator
	diff = "╱", -- Deleted lines in diff mode
	foldclose = "▸", -- Closed fold
	foldopen = "▾", -- Open fold
	fold = " ", -- Fold display
	msgsep = "─", -- Message separator
}

-- Listchars for invisible characters
opt.listchars = {
	tab = " ──",
	trail = "·",
	nbsp = "␣",
	precedes = "«",
	extends = "»",
}
opt.list = true

-- Visual settings
opt.conceallevel = 2
opt.signcolumn = "yes:1"
opt.shortmess:append("sWcI")
opt.formatoptions = "qj"
