return {
	"nvim-tree/nvim-web-devicons",
	lazy = false,
	priority = 1000,
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				folder_closed = {
					icon = "",
					color = "#90a4ae",
					name = "FolderClosed",
				},
				folder_open = {
					icon = "",
					color = "#90a4ae",
					name = "FolderOpen",
				},
			},
			default = true,
		})
	end,
}
