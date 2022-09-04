local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if (not ok) then return end

treesitter.setup {
    autotag = {
        enable = true,
    },
    ensure_installed = {
        "cpp",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "gitignore",
        "go",
        "gomod",
        "http",
        "latex",
        "lua",
        "make",
        "markdown",
        "php",
        "python",
        "ruby",
        "rust",
        "solidity",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
}
