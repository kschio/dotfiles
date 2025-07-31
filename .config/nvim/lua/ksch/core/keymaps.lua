-- set leader key to space
vim.g.mapleader = " "

local km = vim.keymap -- for conciseness

----------------------- General Keymaps -------------------

-- use jk to exit insert mode

-- clear search highlights
km.set("n", "<leader>uh", ":nohl<CR>", { desc = "Clear search highlights" })

-- save
km.set("n", "<leader>w", "<cmd>w<CR>", { desc = "save" })
km.set("n", "<leader>qqq", "<cmd>qa<CR>", { desc = "quit all" })

km.set("n", "<leader>cp", function()
	local path = vim.fn.expand("%:.")
	vim.fn.setreg("+", path) -- copy to clipboard
	vim.notify("Copied: " .. path, vim.log.levels.INFO, { title = "File Path" })
end, { desc = "Copy file path", noremap = true, silent = true })

km.set("n", "J", "mzJ`z")

km.set("i", "C-]", "<Esc>l")

km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

km.set("n", "Q", "<nop>")

km.set("n", "<ScrollWheelRight>", "<nop>")
km.set("n", "<ScrollWheelLeft>", "<nop>")

km.set("n", "<C-d>", "20j")
km.set("n", "<C-u>", "20k")

-- delete single character without copying into register
km.set("n", "x", '"_x')

-- increment/decrement numbers
km.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

km.set("n", "<C-c>", "ciw", { desc = "change inside word" })

-- window management
km.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
km.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
km.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
km.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

km.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
km.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
km.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
km.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
km.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab

-- buffer
km.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" }) -- close current buffer

-- avante
km.set("n", "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Ask AI" })

km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")
