return {
	-- Install telescope with custom picker configuration
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.45,
						},
						width = 0.87,
						height = 0.8,
						preview_cutoff = 120,
					},
					dynamic_preview_title = true,
					path_display = { "truncate" },
					file_ignore_patterns = { "node_modules", ".git/" },
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					selection_strategy = "reset",
					scroll_strategy = "limit",
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					oldfiles = {
						prompt_title = "Recent files",
					},
				},
			})
		end,
	},

	-- Hydra removed - using direct telescope keybindings instead
}
