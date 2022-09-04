local ok, saga = pcall(require, "lspsaga")
if not ok then
    return
end

saga.init_lsp_saga {
    -- general
    border_style = "single",
    max_preview_lines = 30,
    server_filetype_map = {
        typescript = "typescript",
    },

    -- winbar
    symbol_in_winbar = {
        in_custom = true,
        enable = true,
        separator = " > ",
        show_file = true,
        click_support = function(node, clicks, button)
            local st = node.range.start
            local en = node.range["end"]
            if button == "l" then
                if clicks == 2 then
                    vim.fn.cursor(st.line + 1, st.character + 1)
                    vim.cmd.normal "v"
                    vim.fn.cursor(en.line + 1, en.character + 1)
                else
                    vim.fn.cursor(st.line + 1, st.character + 1)
                end
            elseif button == "r" then
                vim.fn.cursor(en.line + 1, en.character + 1)
            elseif button == "m" then
                vim.fn.cursor(st.line + 1, st.character + 1)
                vim.cmd.normal "v"
                vim.fn.cursor(en.line + 1, en.character + 1)
            end
        end,
    },

    -- code actions
    code_action_icon = "🗲 ",
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    code_action_lightbulb = {
        enable = true,
        sign = true,
        enable_in_insert = false,
        sign_priority = 20,
        virtual_text = true,
    },

    -- definition
    definition_preview_icon = " ",

    -- diagnostics
    diagnostic_header = { " ", " ", " ", " " },

    -- finder
    finder_icons = {
        def = "  ",
        ref = "諭 ",
        link = "  ",
    },
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = "<Esc>",
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
    },

    -- rename
    rename_action_quit = "<Esc>",
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("x", "gx", ":<c-u>Lspsaga range_code_action <CR>", opts)
