local ok, wk = pcall(require, "which-key")
if (not ok) then return end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local mappings = {
    ["<leader>"] = { "<cmd>Telescope find_files<cr>", "Files" },
    n = { "<cmd>NvimTreeToggle<cr>", "Tree toggle" },
    e = { "<cmd>NvimTreeFocus<cr>", "Tree focus" },
    w = { "<cmd>write<cr>", "Quick save" },
    q = { "<cmd>write<cr>", "Quick close" },
    b = {
        name = "+Buffer",
        d = { "<cmd>BufDel<cr>", "Buffer delete" },
    },
    f = {
        name = "+File",
        [";"] = { "<cmd>Telescope command_history<cr>", "Command history" },
        ["?"] = { "<cmd>Telescope search_history<cr>", "Search history" },
        ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in file" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        c = { "<cmd>Telescope commands<cr>", "Execute command" },
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        h = { "<cmd>Telescope help_tags<cr>", "Vim help" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
        O = { "<cmd>Telescope vim_options<cr>", "Options" },
        r = { "<cmd>Telescope resume<cr>", "Resume" },
    },
    g = {
        name = "+Lsp",
        a = { "<cmd>LSoutlineToggle<cr>", "Code outline" },
        d = { "<cmd>Lspsaga preview_definition<cr>", "Preview definition" },
        h = { "<cmd>Lspsaga lsp_finder<cr>", "Finder" },
        j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic jump next" },
        k = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic jump prev" },
        K = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
        o = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show line diagnostics" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        s = { "<cmd>Lspsaga signature_help<cr>", "Signature help" },
        x = { "<cmd>Lspsaga code_action<cr>", "Code action" },
    },
    m = {
        name = "+Markdown",
        ["o"] = { "<Plug>MarkdownPreview<cr>", "Markdown Preview" },
        ["p"] = { "<cmd>Glow<cr>", "Markdown Preview inline" },
    },
    p = {
        name = "+Pane split",
        h = { "<cmd>sp<cr>", "Split pane horizontally" },
        v = { "<cmd>vs<cr>", "Split pane vertically" },
    },
    v = {
        name = "+Visuals",
        a = { "<cmd>TZAtaraxis<cr>", "Ataraxis" },
        f = { "<cmd>TZFocus<cr>", "Focus" },
        m = { "<cmd>TZMinimalist<cr>", "Minimalist" },
    },
    z = {
        name = "+Telekasten",
        ["#"] = { "<cmd>Telekasten show_tags<cr>", "Show tags" },
        a = { "<cmd>Telekasten show_tags<cr>", "Show tags" },
        b = { "<cmd>Telekasten show_backlinks<cr>", "Show backlinks" },
        d = { "<cmd>Telekasten find_daily_notes<cr>", "Find daily notes" },
        F = { "<cmd>Telekasten find_friends<cr>", "Find friends" },
        f = { "<cmd>Telekasten find_notes<cr>", "Find notes" },
        g = { "<cmd>Telekasten search_notes<cr>", "Search notes" },
        I = { "<cmd>Telekasten insert_img_link({ i=true })<cr>", "Insert img link" },
        i = { "<cmd>Telekasten paste_img_and_link<cr>", "Paste img & link" },
        m = { "<cmd>Telekasten browse_media<cr>", "Browse media" },
        n = { "<cmd>Telekasten new_note<cr>", "New note" },
        N = { "<cmd>Telekasten new_templated_note<cr>", "New templated note" },
        p = { "<cmd>Telekasten preview_img<cr>", "Preview img" },
        r = { "<cmd>Telekasten rename_note<cr>", "Rename note" },
        T = { "<cmd>Telekasten goto_today<cr>", "Goto today" },
        t = { "<cmd>Telekasten toggle_todo<cr>", "Toggle todo" },
        w = { "<cmd>Telekasten find_weekly_notes<cr>", "Find weekly notes" },
        W = { "<cmd>Telekasten goto_thisweek<cr>", "Goto this week" },
        y = { "<cmd>Telekasten yank_notelink<cr>", "Yank note link" },
        z = { "<cmd>Telekasten follow_link<cr>", "Followlink" },
    },
    x = {
        name = "+Trouble",
        ["d"] = { "<cmd>Trouble document_diagnostics<cr>", "Document diagnostics" },
        ["l"] = { "<cmd>Trouble loclist<cr>", "Loclist" },
        ["q"] = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
        ["w"] = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace diagnostics" },
        ["x"] = { "<cmd>TroubleToggle<cr>", "Toggle" },
    },
}

wk.setup(setup)
wk.register(mappings, opts)
