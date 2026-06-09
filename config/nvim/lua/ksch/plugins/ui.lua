return {
	-- Apply custom UI settings
	{
		"folke/lazy.nvim",
		priority = 10000,
		config = function()
			-- Visual options
			vim.opt.conceallevel = 2
			vim.opt.signcolumn = "yes:1"
			vim.opt.wrap = false
			vim.opt.scrolloff = 4

			-- Fillchars for clean borders and UI elements
			vim.opt.fillchars = {
				eob = " ", -- Empty lines at the end of buffer
				vert = " ", -- Vertical split separator
				horiz = " ", -- Horizontal split separator
				diff = "╱", -- Deleted lines in diff mode
				foldclose = "▸", -- Closed fold
				foldopen = "▾", -- Open fold
				fold = " ", -- Fold display
				msgsep = "─", -- Message separator
			}

			-- Listchars for invisible characters
			vim.opt.listchars = {
				tab = " ──",
				trail = "·",
				nbsp = "␣",
				precedes = "«",
				extends = "»",
			}
			vim.opt.list = true

			-- Timeout settings
			vim.opt.updatetime = 250
			vim.opt.timeoutlen = 400

			-- Neovide-specific padding (if using Neovide)
			if vim.g.neovide then
				vim.g.neovide_padding_top = 45
				vim.g.neovide_padding_left = 38
				vim.g.neovide_padding_right = 38
				vim.g.neovide_padding_bottom = 20
				vim.g.neovide_font = "Liga SFMono Nerd Font:h14"
			end

			-- GUI font settings
			vim.opt.guifont = "Liga SFMono Nerd Font:h14"
		end,
	},

	-- Disable indent guides completely
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
	},

	-- Smooth scrolling
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		opts = {
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
			hide_cursor = true,
			stop_eof = true,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			easing_function = "sine",
			pre_hook = nil,
			post_hook = nil,
			performance_mode = false,
		},
	},

	-- Add padding to windows
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = {
				backdrop = 1,
				width = 120,
				height = 1,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false,
					showcmd = false,
					laststatus = 0,
				},
				twilight = { enabled = false },
				gitsigns = { enabled = false },
				tmux = { enabled = false },
			},
		},
	},
}
