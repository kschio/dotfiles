local ok, trouble = pcall(require, "trouble")
if not ok then
    return
end

trouble.setup {
    mode = "document_diagnostics",
    auto_open = false,
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠",
    },
    use_diagnostic_signs = true,
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
