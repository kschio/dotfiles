local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting

local my_sources = {
    -- code actions
    null_ls.builtins.code_actions.gitsigns,

    -- completion
    null_ls.builtins.completion.luasnip,

    -- diagnostics
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.diagnostics.solhint,

    -- formatting
    formatting.black,
    formatting.eslint_d,
    formatting.fixjson,
    formatting.prettier,
    formatting.stylua,
}

null_ls.setup {
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
    sources = my_sources,
}
