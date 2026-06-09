return {
	"nvim-telescope/telescope.nvim",
	keys = {
		-- Quick access (most used)
		{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>.", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },

		-- Find (files/buffers - structural)
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
		{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find marks" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },
		{ "<leader>fC", "<cmd>Telescope colorscheme<cr>", desc = "Find colorscheme" },

		-- Search (content/symbols - semantic)
		{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Search grep" },
		{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search word", mode = { "n", "x" } },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search buffer" },
		{ "<leader>sB", "<cmd>Telescope live_grep buffers=all<cr>", desc = "Search all buffers" },
		{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search symbols" },
		{ "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Search workspace symbols" },
		{ "<leader>sh", "<cmd>Telescope search_history<cr>", desc = "Search history" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Search command history" },
		{ "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Search registers" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume search" },

		-- Git
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
		{ "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Git buffer commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
		{ "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },

		-- LSP navigation (go to...)
		{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition" },
		{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
		{ "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementation" },
		{ "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Go to type definition" },
		{ "gD", "<cmd>Telescope lsp_declarations<cr>", desc = "Go to declaration" },

		-- LSP info
		{ "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "LSP diagnostics" },
		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP document symbols" },
		{ "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "LSP workspace symbols" },
		{ "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "LSP references" },
		{ "<leader>li", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "LSP incoming calls" },
		{ "<leader>lo", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "LSP outgoing calls" },

		-- Help/UI
		{ "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help pages" },
		{ "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
		{ "<leader>hH", "<cmd>Telescope highlights<cr>", desc = "Highlight groups" },
		{ "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Show keymaps" },
		{ "<leader>ht", "<cmd>Telescope builtin<cr>", desc = "Telescope pickers" },

		-- Extras
		{ "<leader>uC", "<cmd>Telescope colorscheme<cr>", desc = "UI colorschemes" },
	},
}