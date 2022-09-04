local ok, nvim_lsp = pcall(require, "lspconfig")
if (not ok) then return end

local icons = require "ksch.appearance.icons"
local protocol = require "vim.lsp.protocol"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local common_on_attach = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
end

protocol.CompletionItemKind = {
    icons.Text,
    icons.Method,
    icons.Function,
    icons.Constructor,
    icons.Field,
    icons.Variable,
    icons.Class,
    icons.Interface,
    icons.Module,
    icons.Property,
    icons.Unit,
    icons.Value,
    icons.Enum,
    icons.Keyword,
    icons.Snippet,
    icons.Color,
    icons.File,
    icons.Reference,
    icons.Folder,
    icons.EnumMember,
    icons.Constant,
    icons.Struct,
    icons.Event,
    icons.Operator,
    icons.TypeParameter,
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Don't auto format when clashing LSP's with null-ls
local no_auto_format = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentOnTypeFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

----------------------
-- Language Servers --
----------------------

-- css
nvim_lsp.cssls.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- docker
nvim_lsp.dockerls.setup {
    on_attach = common_on_attach,
}

-- golang
nvim_lsp.gopls.setup {
    on_attach = common_on_attach,
}

-- lua
nvim_lsp.sumneko_lua.setup {
    on_attach = no_auto_format,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            runtime = {
                version = "LuaJIT",
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
}

-- markdown
nvim_lsp.marksman.setup {
    on_attach = common_on_attach,
}

-- python
nvim_lsp.pyright.setup {
    on_attach = common_on_attach,
}

-- solidity
nvim_lsp.solidity_ls.setup {
    on_attach = common_on_attach,
}

-- SQL
nvim_lsp.sqls.setup {
    on_attach = common_on_attach,
}

-- tailwind css
nvim_lsp.tailwindcss.setup {
    on_attach = common_on_attach,
}

-- toml
nvim_lsp.taplo.setup {
    on_attach = common_on_attach,
}

-- typescript
nvim_lsp.tsserver.setup {
    on_attach = no_auto_format,
}

-- yaml
nvim_lsp.yamlls.setup {
    on_attach = common_on_attach,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type

    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = "",
    })
end

vim.diagnostic.config {
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
}
