return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, position = "right" })
			end,
			desc = "Toggle file explorer",
		},
		{
			"<leader>E",
			function()
				require("neo-tree.command").execute({ focus = true, position = "right" })
			end,
			desc = "Focus file explorer",
		},
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "right",
				width = 40,
				mappings = {
					["<cr>"] = "open",
					["l"] = "open",
					["h"] = "close_node",
					["<2-LeftMouse>"] = "open",
					["<space>"] = "none",
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				hijack_netrw_behavior = "disabled",
				use_libuv_file_watcher = true,
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		})
	end,
}
