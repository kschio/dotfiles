return {
	"echasnovski/mini.icons",
	version = false,
	lazy = false,
	priority = 900,
	config = function()
		require("mini.icons").setup({
			style = "glyph", -- 'glyph' or 'ascii'
			-- Use the same icons as nvim-web-devicons for consistency
			default = {
				file = { glyph = "", hl = "MiniIconsGrey" },
				folder = { glyph = "", hl = "MiniIconsFolder" },
			},
		})
	end,
}
