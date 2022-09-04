local map = vim.keymap
local opts = { noremap = true, silent = true }

-- General
map.set("n", "<Esc>", ":noh <CR>", opts) -- clear search highlight

-- Buffers/Tabs
map.set("n", "<S-t>", ":enew <CR>", opts) -- new buffer
