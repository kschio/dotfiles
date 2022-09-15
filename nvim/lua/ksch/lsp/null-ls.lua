local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

local my_sources = {
    -- code actions
    actions.gitsigns,
    actions.shellcheck,

    -- completion
    completion.luasnip,

    -- diagnostics
    diagnostics.eslint_d,
    diagnostics.selene,
    diagnostics.solhint,

    -- formatting
    formatting.terraform_fmt,
    formatting.black,
    formatting.eslint_d,
    formatting.prettier,
    formatting.stylua,
    formatting.markdownlint,
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
