local ok, lualine = pcall(require, "lualine")
if (not ok) then return end

lualine.setup {
    options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { { "mode" } },
        lualine_b = { { "branch" }, "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
            {
                "filetype",
                fmt = function(str)
                    return vim.lsp.buf.server_ready() and str .. "+" or str
                end,
                icons_enabled = true,
            },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename" } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {},
}
