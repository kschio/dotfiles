-- set leader key to space
vim.g.mapleader = " "

local km = vim.keymap -- for conciseness

----------------------- General Keymaps -------------------

-- use jk to exit insert mode

-- clear search highlights
km.set("n", "<leader>hc", ":nohl<CR>", { desc = "Clear search highlights" })

-- save & quit
km.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write/save file" })
km.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Write all buffers" })
km.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
km.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit all" })
km.set("n", "<leader>q!", "<cmd>q!<CR>", { desc = "Quit without saving" })

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

-- window/split management (using 'o' for open)
km.set("n", "<leader>ov", "<C-w>v", { desc = "Open vertical split" })
km.set("n", "<leader>oh", "<C-w>s", { desc = "Open horizontal split" })
km.set("n", "<leader>oe", "<C-w>=", { desc = "Equal split sizes" })
km.set("n", "<leader>oc", "<cmd>close<CR>", { desc = "Close current split" })
km.set("n", "<leader>oo", "<C-w>o", { desc = "Close other splits" })

-- tab management
km.set("n", "<leader>ot", "<cmd>tabnew<CR>", { desc = "Open new tab" })
km.set("n", "<leader>ox", "<cmd>tabclose<CR>", { desc = "Close current tab" })
km.set("n", "<leader>on", "<cmd>tabn<CR>", { desc = "Next tab" })
km.set("n", "<leader>op", "<cmd>tabp<CR>", { desc = "Previous tab" })
km.set("n", "<leader>of", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- buffer navigation
km.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
km.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
km.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete current buffer" })
km.set("n", "<leader>bD", "<cmd>bd!<CR>", { desc = "Force delete buffer" })
km.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
km.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
km.set("n", "<leader>ba", "<cmd>%bd|e#<CR>", { desc = "Delete all buffers except current" })

-- avante/AI
km.set("n", "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Ask AI" })
km.set("n", "<leader>ac", "<cmd>AvanteChat<CR>", { desc = "AI Chat" })
km.set("n", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "AI Edit" })

-- Visual mode improvements
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quick access (most used)
km.set("n", "<leader><space>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
km.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
km.set("n", "<leader>.", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
km.set("n", "<leader>,", "", { desc = "Harpoon menu" }) -- Will be set in harpoon.lua

-- UI toggles
km.set("n", "<leader>ui", "", { desc = "Toggle inlay hints" }) -- Will be set by LSP
km.set("n", "<leader>uw", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })
km.set("n", "<leader>un", "<cmd>set number!<CR>", { desc = "Toggle line numbers" })
km.set("n", "<leader>ur", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative numbers" })
km.set("n", "<leader>us", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })