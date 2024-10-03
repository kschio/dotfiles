return {
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = "VeryLazy",
		enabled = true,
		opts = {
			health = { checker = false },
			cmdline = {
				format = {
					cmdline = { pattern = "^:", icon = " ", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
					help = { pattern = "^:%s*h%s+", icon = "" },
					input = {},
				},
				opts = {
					win_options = {
						winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
					},
				},
			},
			lsp = {
				progress = { enabled = true },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			views = {
				cmdline_popup = {
					position = { row = 0, col = "50%" },
					size = { width = "98%" },
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
			popupmenu = { backend = "cmp" },
			routes = {
				{
					filter = {
						event = "msg_show",
						find = "%d+L, %d+B",
					},
					view = "mini",
				},
			},
		},
		config = function(_, opts)
			require("noice").setup(opts)

			-- Set up vim.notify
			local old_notify = vim.notify
			vim.notify = function(msg, level, options)
				if vim.fn.exists(":Noice") == 2 then
					old_notify(msg, level, options)
				else
					vim.cmd("packadd nvim-notify")
					vim.notify = require("notify")
					vim.notify(msg, level, options)

					-- Check if telescope is available and load the notify extension
					local ok, telescope = pcall(require, "telescope")
					if ok then
						telescope.load_extension("notify")
					end
				end
			end
		end,
		keys = {
			{
				"<S-Enter>",
				function()
					require("noice").redirect(vim.fn.getcmdline())
				end,
				mode = "c",
				desc = "Redirect Cmdline",
			},
			{
				"<c-f>",
				function()
					if not require("noice.lsp").scroll(4) then
						return "<c-f>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll forward",
			},
			{
				"<c-b>",
				function()
					if not require("noice.lsp").scroll(-4) then
						return "<c-b>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll backward",
			},
		},
	},
}
