local ok, bufdel = pcall(require, "bufdel")

if (not ok) then return end

bufdel.setup {
    next = "cycle",
    quit = false,
}