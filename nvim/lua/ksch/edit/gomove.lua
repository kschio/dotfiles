local ok, gomove = pcall(require, "gomove")

if (not ok) then return end

gomove.setup {
    map_defaults = false,
    reindent = true,
    undojoin = true,
    move_past_end_col = false,
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<S-h>", "<Plug>GoNSMLeft", opts) -- Move left
map("n", "<S-j>", "<Plug>GoNSMDown", opts) -- Move down
map("n", "<S-k>", "<Plug>GoNSMUp", opts) -- Move up
map("n", "<S-l>", "<Plug>GoNSMRight", opts) -- Move right

map("x", "<S-h>", "<Plug>GoVSMLeft", opts) -- Move left (visual)
map("x", "<S-j>", "<Plug>GoVSMDown", opts) -- Move down (visual)
map("x", "<S-k>", "<Plug>GoVSMUp", opts) -- Move up (visual)
map("x", "<S-l>", "<Plug>GoVSMRight", opts) -- Move right (visual)

map("n", "<C-h>", "<Plug>GoNSDLeft", opts) -- Duplicate left
map("n", "<C-j>", "<Plug>GoNSDDown", opts) -- Duplicate down
map("n", "<C-k>", "<Plug>GoNSDUp", opts) -- Duplicate up
map("n", "<C-l>", "<Plug>GoNSDRight", opts) -- Duplicate right

map("x", "<C-h>", "<Plug>GoVSDLeft", opts) -- Duplicate left (Visual)
map("x", "<C-j>", "<Plug>GoVSDDown", opts) -- Duplicate down (Visual)
map("x", "<C-k>", "<Plug>GoVSDUp", opts) -- Duplicate up (Visual)
map("x", "<C-l>", "<Plug>GoVSDRight", opts) -- Duplicate right (Visual)
