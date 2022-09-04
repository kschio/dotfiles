local ok, trouble = pcall(require, "trouble")
if not ok then
    return
end

trouble.setup {
    signs = {
        error = "",
        hint = "",
        information = "",
        warning = "",
    },
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "gR", ":Trouble lsp_references <CR>", opts)
