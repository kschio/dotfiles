local ok, packer = pcall(require, "packer")
if not ok then
    print "Packer is not installed"
    return
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost /Users/ksch/.config/nvim/lua/ksch/settings/plugins.lua source <afile> | PackerSync
  augroup end
]]

packer.init {
    auto_clean = true,
    compile_on_sync = true,
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "single",
            }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 6000, -- seconds
    },
}

return packer.startup(function(use)
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
    }
    use "folke/trouble.nvim"
    use "glepnir/dashboard-nvim"
    use "glepnir/lspsaga.nvim"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    }
    use "jose-elias-alvarez/null-ls.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use "L3MON4D3/LuaSnip"
    use "lewis6991/gitsigns.nvim"
    use "lewis6991/impatient.nvim"
    use "neovim/nvim-lspconfig"
    use "norcalli/nvim-colorizer.lua"
    use "numToStr/Comment.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lualine/lualine.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
    }
    use "nvim-telescope/telescope-fzf-native.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "ojroques/nvim-bufdel"
    use "rafamadriz/friendly-snippets"
    use "saadparwaiz1/cmp_luasnip"
    use "TovarishFin/vim-solidity"
    use "wbthomason/packer.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "williamboman/mason.nvim"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    -- extras
    use {
        "akinsho/toggleterm.nvim",
        tag = "v2.*",
    }
    use "anuvyklack/hydra.nvim"
    use "B4mbus/oxocarbon-lua.nvim"
    use "booperlv/nvim-gomove"
    use "ellisonleao/glow.nvim"
    use "folke/todo-comments.nvim"
    use "folke/which-key.nvim"
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
    use "kylechui/nvim-surround"
    use "Pocco81/true-zen.nvim"
    use "ray-x/lsp_signature.nvim"
    use "renerocksai/telekasten.nvim"
    use {
        "TimUntersberger/neogit",
        requires = "nvim-lua/plenary.nvim",
    }
end)
