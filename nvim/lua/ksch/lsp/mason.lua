local ok, mason = pcall(require, "mason")
if not ok then
    return
end

local okLspConfig, lspconfig = pcall(require, "mason-lspconfig")
if not okLspConfig then
    return
end

local okToolInstaller, toolinstaller = pcall(require, "mason-tool-installer")
if not okToolInstaller then
    return
end

mason.setup {
    check_outdated_packages_on_open = true,
    border = "none",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

lspconfig.setup {}

toolinstaller.setup {
    ensure_installed = {
        -- LSP
        "bash-language-server",
        "dockerfile-language-server",
        "json-lsp",
        "typescript-language-server",
        "texlab",
        "lua-language-server",
        "pyright",
        "terraform-ls",
        "yaml-language-server",
        -- Formatter
        "black",
        "prettier",
        "stylua",
        -- Linter
        "eslint_d",
        "shellcheck",
        "tflint",
        "vale",
        "yamllint",
        -- DAP
        "debugpy",
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 3000,
}
