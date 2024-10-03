return {
	"Pocco81/true-zen.nvim",
	event = "VeryLazy",
	enabled = true,
	config = function()
		require("true-zen").setup({
			-- Add your configuration options here
		})

		-- Set up keybindings
		vim.keymap.set("n", "<leader>zn", require("true-zen").narrow, { desc = "Narrow" })
		vim.keymap.set("v", "<leader>zn", require("true-zen").narrow, { desc = "Narrow" })
		vim.keymap.set("n", "<leader>zf", require("true-zen").focus, { desc = "Focus" })
		vim.keymap.set("n", "<leader>zm", require("true-zen").minimalist, { desc = "Minimalist" })
		vim.keymap.set("n", "<leader>za", require("true-zen").ataraxis, { desc = "Ataraxis" })
	end,
}
