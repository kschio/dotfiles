return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- For icon support
    },
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 400
    end,
    opts = {
        -- Window configuration
        win = {
            border = "single", -- Clean single border
            padding = { 1, 2 }, -- {top/bottom, left/right}
            title = true,
            title_pos = "center",
        },
        -- Layout configuration
        layout = {
            spacing = 3,
            align = "center",
        },
        -- Icons configuration (uses nvim-web-devicons)
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
            ellipsis = "…",
            -- Enable proper icon display
            mappings = true,
            rules = {},
            -- Show icons from nvim-web-devicons
            keys = {
                Up = "󰁝",
                Down = "󰁅",
                Left = "󰁍",
                Right = "󰁔",
                C = "󰘴 ",
                M = "󰘵 ",
                D = "󰘳 ",
                S = "󰘶 ",
                CR = "󰌑 ",
                Esc = "󱊷 ",
                ScrollWheelDown = " ",
                ScrollWheelUp = " ",
                NL = "󰌑 ",
                BS = "󰌍 ",
                Space = "󱁐 ",
                Tab = "󰌒 ",
                F1 = "󱊫",
                F2 = "󱊬",
                F3 = "󱊭",
                F4 = "󱊮",
                F5 = "󱊯",
                F6 = "󱊰",
                F7 = "󱊱",
                F8 = "󱊲",
                F9 = "󱊳",
                F10 = "󱊴",
                F11 = "󱊵",
                F12 = "󱊶",
            },
        },
        -- Disable which-key for certain file types and buffer types
        disable = {
            ft = { "TelescopePrompt" },
            bt = {}, -- Empty buffers are allowed
        },
        -- Show hidden mappings
        show_help = true,
        show_keys = true,
        -- Triggers - when which-key opens automatically
        triggers = {
            { "<auto>", mode = "nixsotc" },
        },
        -- Filter function to exclude certain mappings
        filter = function(mapping)
            -- exclude mappings without a description
            return mapping.desc and mapping.desc ~= ""
        end,
        -- Replace key labels
        replace = {
            key = {
                { "<Space>", "SPC" },
                { "<CR>",    "RET" },
                { "<Tab>",   "TAB" },
            },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)

        -- Register key groups
        wk.add({
            -- Main groups
            { "<leader>b", group = "buffers", icon = "󰖱" },
            { "<leader>c", group = "code", icon = "󰵮" },
            { "<leader>d", group = "debug", icon = "󰨯" },
            { "<leader>e", desc = "Explorer", icon = "󰙅" },
            { "<leader>f", group = "find", icon = "󱎸" },
            { "<leader>g", group = "git", icon = "󰊢" },
            { "<leader>gh", group = "git hunks", icon = "󰊤" },
            { "<leader>h", group = "help/ui", icon = "󰋖" },
            { "<leader>j", group = "jump/harpoon", icon = "󰃃" },
            { "<leader>l", group = "lsp", icon = "󰅳" },
            { "<leader>m", group = "modify/format", icon = "󰉼" },
            { "<leader>o", group = "open/windows", icon = "󰯌" },
            { "<leader>q", group = "quit/session", icon = "󰩈" },
            { "<leader>r", group = "rename/replace", icon = "󰑕" },
            { "<leader>s", group = "search", icon = "󰍉" },
            { "<leader>t", group = "terminal/test", icon = "󰓩" },
            { "<leader>u", group = "ui toggles", icon = "󰣆" },
            { "<leader>w", desc = "Write/save", icon = "󰆓" },
            { "<leader>x", group = "trouble/diagnostics", icon = "󰀦" },
            { "<leader>z", group = "zen/focus", icon = "󰚀" },

            -- Quick access (most used)
            { "<leader><space>", desc = "Find files", icon = "󰈞" },
            { "<leader>/", desc = "Live grep", icon = "󰺮" },
            { "<leader>.", desc = "Recent files", icon = "󰋚" },
            { "<leader>,", desc = "Harpoon menu", icon = "󰃃" },

            -- Number keys for Harpoon
            { "<leader>1", desc = "Harpoon 1", icon = "󰬺" },
            { "<leader>2", desc = "Harpoon 2", icon = "󰬻" },
            { "<leader>3", desc = "Harpoon 3", icon = "󰬼" },
            { "<leader>4", desc = "Harpoon 4", icon = "󰬽" },
            { "<leader>5", desc = "Harpoon 5", icon = "󰬾" },
            { "<leader>6", desc = "Harpoon 6", icon = "󰬿" },
            { "<leader>7", desc = "Harpoon 7", icon = "󰭀" },
            { "<leader>8", desc = "Harpoon 8", icon = "󰭁" },
            { "<leader>9", desc = "Harpoon 9", icon = "󰭂" },

            -- Buffers
            { "<leader>bd", desc = "Delete buffer", icon = "󰅖" },
            { "<leader>bD", desc = "Force delete buffer", icon = "󰅖" },
            { "<leader>bn", desc = "Next buffer", icon = "󰒭" },
            { "<leader>bp", desc = "Previous buffer", icon = "󰒮" },
            { "<leader>ba", desc = "Delete all except current", icon = "󰗼" },

            -- Code (LSP actions)
            { "<leader>ca", desc = "Code actions", icon = "󰌵" },
            { "<leader>cr", desc = "Code rename", icon = "󰑕" },
            { "<leader>cf", desc = "Code format", icon = "󰉼" },
            { "<leader>cs", desc = "Symbols (Trouble)", icon = "󰆋" },
            { "<leader>cl", desc = "LSP definitions/references", icon = "󰆋" },
            { "<leader>cp", desc = "Copy file path", icon = "󰆏" },

            -- Debug
            { "<leader>db", desc = "Toggle breakpoint", icon = "󰆹" },
            { "<leader>dc", desc = "Continue", icon = "󰆷" },
            { "<leader>dx", desc = "Terminate", icon = "󰆸" },
            { "<leader>de", desc = "Evaluate", icon = "󰇀" },
            { "<leader>dt", desc = "Toggle UI", icon = "󰖯" },
            { "<leader>ds", desc = "Step over", icon = "󰆶" },
            { "<leader>di", desc = "Step into", icon = "󰆤" },
            { "<leader>do", desc = "Step out", icon = "󰆧" },

            -- Explorer
            { "<leader>e", desc = "Toggle explorer", icon = "󰙅" },
            { "<leader>E", desc = "Focus explorer", icon = "󰙅" },

            -- Find (files/buffers)
            { "<leader>ff", desc = "Find files", icon = "󰈞" },
            { "<leader>fg", desc = "Git files", icon = "󰊢" },
            { "<leader>fr", desc = "Recent files", icon = "󰋚" },
            { "<leader>fb", desc = "Find buffers", icon = "󰖱" },
            { "<leader>fh", desc = "Find help", icon = "󰋖" },
            { "<leader>fm", desc = "Find marks", icon = "󰃀" },
            { "<leader>fk", desc = "Find keymaps", icon = "󰌌" },
            { "<leader>fc", desc = "Find commands", icon = "󰘳" },
            { "<leader>fC", desc = "Find colorscheme", icon = "󰸌" },

            -- Git
            { "<leader>gg", desc = "LazyGit", icon = "󰊢" },
            { "<leader>gc", desc = "Git commits", icon = "󰊢" },
            { "<leader>gC", desc = "Git buffer commits", icon = "󰊢" },
            { "<leader>gs", desc = "Git status", icon = "󰊢" },
            { "<leader>gb", desc = "Git branches", icon = "󰊢" },
            { "<leader>gS", desc = "Git stash", icon = "󰊢" },
            { "<leader>gf", desc = "Git files", icon = "󰊢" },

            -- Git Hunks
            { "<leader>ghs", desc = "Stage hunk", icon = "󰊤" },
            { "<leader>ghr", desc = "Reset hunk", icon = "󰜉" },
            { "<leader>ghS", desc = "Stage buffer", icon = "󰊤" },
            { "<leader>ghR", desc = "Reset buffer", icon = "󰜉" },
            { "<leader>ghu", desc = "Undo stage hunk", icon = "󰕌" },
            { "<leader>ghp", desc = "Preview hunk", icon = "󰡏" },
            { "<leader>ghb", desc = "Blame line (full)", icon = "󰊢" },
            { "<leader>ghB", desc = "Toggle line blame", icon = "󰊢" },
            { "<leader>ghd", desc = "Diff this", icon = "󰡏" },
            { "<leader>ghD", desc = "Diff this ~", icon = "󰡏" },
            { "<leader>ghn", desc = "Next hunk", icon = "󰒭" },
            { "<leader>ghN", desc = "Previous hunk", icon = "󰒮" },

            -- Help/UI
            { "<leader>hh", desc = "Help pages", icon = "󰋖" },
            { "<leader>hm", desc = "Man pages", icon = "󰊱" },
            { "<leader>hH", desc = "Highlight groups", icon = "󰸱" },
            { "<leader>hk", desc = "Show keymaps", icon = "󰌌" },
            { "<leader>ht", desc = "Telescope pickers", icon = "󰍉" },
            { "<leader>hc", desc = "Clear search highlights", icon = "󰅖" },

            -- Jump/Harpoon
            { "<leader>ja", desc = "Add to Harpoon", icon = "󰃃" },
            { "<leader>jd", desc = "Remove from Harpoon", icon = "󰅖" },
            { "<leader>jc", desc = "Clear Harpoon", icon = "󰆴" },
            { "<leader>jn", desc = "Next Harpoon", icon = "󰒭" },
            { "<leader>jp", desc = "Previous Harpoon", icon = "󰒮" },
            { "<leader>jt", desc = "Harpoon Telescope", icon = "󰍉" },

            -- LSP info
            { "<leader>ld", desc = "LSP diagnostics", icon = "󰀦" },
            { "<leader>lD", desc = "LSP buffer diagnostics", icon = "󰀦" },
            { "<leader>ll", desc = "LSP line diagnostics", icon = "󰀦" },
            { "<leader>ls", desc = "LSP document symbols", icon = "󰆋" },
            { "<leader>lS", desc = "LSP workspace symbols", icon = "󰆋" },
            { "<leader>lr", desc = "LSP references", icon = "󰆋" },
            { "<leader>li", desc = "LSP incoming calls", icon = "󰏪" },
            { "<leader>lo", desc = "LSP outgoing calls", icon = "󰏫" },
            { "<leader>lI", desc = "LSP info", icon = "󰅳" },
            { "<leader>lR", desc = "LSP restart", icon = "󰑓" },

            -- Modify/Format
            { "<leader>mp", desc = "Format file or range", icon = "󰉼" },

            -- Open/Windows
            { "<leader>ov", desc = "Open vertical split", icon = "󰯌" },
            { "<leader>oh", desc = "Open horizontal split", icon = "󰯋" },
            { "<leader>oe", desc = "Equal split sizes", icon = "󰘞" },
            { "<leader>oc", desc = "Close current split", icon = "󰅖" },
            { "<leader>oo", desc = "Close other splits", icon = "󰗼" },
            { "<leader>ot", desc = "Open new tab", icon = "󰓩" },
            { "<leader>ox", desc = "Close current tab", icon = "󰭌" },
            { "<leader>on", desc = "Next tab", icon = "󰒭" },
            { "<leader>op", desc = "Previous tab", icon = "󰒮" },
            { "<leader>of", desc = "Open buffer in new tab", icon = "󰯍" },

            -- Quit
            { "<leader>qq", desc = "Quit", icon = "󰿅" },
            { "<leader>qa", desc = "Quit all", icon = "󰿅" },
            { "<leader>q!", desc = "Quit without saving", icon = "󰿅" },

            -- Search (content/symbols)
            { "<leader>sg", desc = "Search grep", icon = "󰺮" },
            { "<leader>sw", desc = "Search word", icon = "󰺮" },
            { "<leader>sb", desc = "Search buffer", icon = "󰺮" },
            { "<leader>sB", desc = "Search all buffers", icon = "󰺮" },
            { "<leader>ss", desc = "Search symbols", icon = "󰆋" },
            { "<leader>sS", desc = "Search workspace symbols", icon = "󰆋" },
            { "<leader>sh", desc = "Search history", icon = "󰋚" },
            { "<leader>sc", desc = "Search command history", icon = "󰋚" },
            { "<leader>sr", desc = "Search registers", icon = "󰀱" },
            { "<leader>sR", desc = "Resume search", icon = "󰑓" },

            -- UI toggles
            { "<leader>ui", desc = "Toggle inlay hints", icon = "󰏪" },
            { "<leader>uw", desc = "Toggle word wrap", icon = "󰖶" },
            { "<leader>un", desc = "Toggle line numbers", icon = "󰎠" },
            { "<leader>ur", desc = "Toggle relative numbers", icon = "󰎠" },
            { "<leader>us", desc = "Toggle spell check", icon = "󰓆" },
            { "<leader>uC", desc = "UI colorschemes", icon = "󰸌" },
            { "<leader>uh", desc = "Toggle search highlights", icon = "󰸱" },
            { "<leader>u", desc = "Undo history", icon = "󰕌" },

            -- Write
            { "<leader>w", desc = "Write/save file", icon = "󰆓" },
            { "<leader>wa", desc = "Write all buffers", icon = "󰆓" },

            -- Trouble
            { "<leader>xx", desc = "Diagnostics (Trouble)", icon = "󰀦" },
            { "<leader>xX", desc = "Buffer diagnostics (Trouble)", icon = "󰀦" },
            { "<leader>xL", desc = "Location list", icon = "󰋱" },
            { "<leader>xQ", desc = "Quickfix list", icon = "󰁨" },

            -- Zen/Focus
            { "<leader>zm", desc = "Toggle Zen Mode", icon = "󰚀" },
            { "<leader>ctx", desc = "Toggle TreeSitter context", icon = "󰊷" },

            -- Other
            { "<leader>+", desc = "Increment number", icon = "󰐕" },
            { "<leader>-", desc = "Decrement number", icon = "󰍴" },
            { "<leader>?", desc = "Buffer local keymaps", icon = "?" },

            -- Non-leader mappings
            { "<C-e>", desc = "Toggle Harpoon menu", icon = "󰃃" },
            { "<Tab>", desc = "Next buffer", icon = "󰒭" },
            { "<S-Tab>", desc = "Previous buffer", icon = "󰒮" },
            { "[d", desc = "Previous diagnostic", icon = "󰒮" },
            { "]d", desc = "Next diagnostic", icon = "󰒭" },
            { "[g", desc = "Previous git hunk", icon = "󰒮" },
            { "]g", desc = "Next git hunk", icon = "󰒭" },
            { "gd", desc = "Go to definition", icon = "󰆋" },
            { "gr", desc = "Go to references", icon = "󰆋" },
            { "gi", desc = "Go to implementation", icon = "󰆋" },
            { "gt", desc = "Go to type definition", icon = "󰆋" },
            { "gD", desc = "Go to declaration", icon = "󰆋" },
            { "K", desc = "Hover documentation", icon = "󰋖" },
        })

        -- Custom highlights for aesthetic
        vim.api.nvim_set_hl(0, "WhichKey", { fg = "#7aa2f7", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#bb9af7", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#a9b1d6", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#565f89", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#161616" })
        vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#393939" })
        vim.api.nvim_set_hl(0, "WhichKeyIcon", { fg = "#7dcfff", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconAzure", { fg = "#7dcfff", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconBlue", { fg = "#7aa2f7", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconCyan", { fg = "#7dcfff", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconGreen", { fg = "#9ece6a", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconGrey", { fg = "#565f89", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconOrange", { fg = "#ff9e64", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconPurple", { fg = "#bb9af7", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconRed", { fg = "#f7768e", underline = false })
        vim.api.nvim_set_hl(0, "WhichKeyIconYellow", { fg = "#e0af68", underline = false })
    end,
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps",
        },
    },
}
