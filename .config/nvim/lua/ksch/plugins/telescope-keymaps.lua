return {
	"nvim-telescope/telescope.nvim",
	keys = {
		-- Find
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader><space>", "<cmd>Telescope buffers<cr>", desc = "Find Files" },

		-- Grep
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		{
			"<leader>sw",
			"<cmd>Telescope grep_string<cr>",
			desc = "Word under cursor",
			mode = { "n", "x" },
		},
		{ "<leader>sB", "<cmd>Telescope live_grep buffers=all<cr>", desc = "Grep Open Buffers" },

		-- Search
		{ "<leader>s:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
		{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>uC", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },

		-- Git
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Log" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },

		-- LSP
		{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
		{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
		{ "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
		{ "<leader>fl", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Symbols" },
		{ "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
	},
}
