local ok, telescope = pcall(require, "telescope")
if (not ok) then return end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        entry_prefix = "  ",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        initial_mode = "insert",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        path_display = { "truncate" },
        prompt_prefix = "   ",
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        selection_caret = "  ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        use_less = true,
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        winblend = 0,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
}

local extensions = {
    "media_files",
    "themes",
    "terms",
}

pcall(function()
    for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
    end
end)
