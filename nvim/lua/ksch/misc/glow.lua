local ok, glow = pcall(require, "glow")
if (not ok) then return end

glow.setup {
    border = "rounded",
    width = 120,
}
