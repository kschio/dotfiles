local ok, telekasten = pcall(require, "telekasten")
if not ok then
    return
end

local home = vim.fn.expand "/Users/ksch/Notes"

telekasten.setup {
    home = home,
    dailies = home .. "/" .. "Journal",
    weeklies = home .. "/" .. "Journal",
    templates = home .. "/" .. "Templates",
    template_new_note = home .. "/" .. "Templates/new_note.md",
    template_new_daily = home .. "/" .. "Templates/daily.md",
    template_new_weekly = home .. "/" .. "Templates/weekly.md",
    extension = ".md",
    image_link_style = "markdown",
    sort = "filename",
    tag_notation = "#tag",
}
