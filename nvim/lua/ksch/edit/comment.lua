local ok, comment = pcall(require, "Comment")
if not ok then
    return
end

comment.setup()

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("v", "<leader>/", ":lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", opts)
