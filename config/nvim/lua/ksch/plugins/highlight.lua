return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			enabled_named_colors = false,
		})
		vim.cmd("HighlightColors Off")
		vim.keymap.set("n", "<leader>uc", "<cmd>HighlightColors Toggle<cr>", { desc = "Toggle color highlights" })
	end,
}
