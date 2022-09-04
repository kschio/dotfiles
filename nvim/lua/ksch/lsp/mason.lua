local ok, mason = pcall(require, "mason")
if (not ok) then return end

local ok2, lspconfig = pcall(require, "mason-lspconfig")
if (not ok2) then return end

mason.setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

lspconfig.setup {
    ensure_installed = {
        "cssls",
        "dockerls",
        "gopls",
        "marksman",
        "pyright",
        "sumneko_lua",
        "sqls",
        "tailwindcss",
        "taplo",
        'eslint_d',
        'prettierd',
        'typescript-language-server',
        "tsserver",
        "yamlls",
    },
}
