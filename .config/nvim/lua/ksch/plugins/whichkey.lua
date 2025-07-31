return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- For icon support
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 400
	end,
	opts = {
		-- Window configuration
		win = {
			border = "single", -- Clean single border
			padding = { 1, 2 }, -- {top/bottom, left/right}
			title = true,
			title_pos = "center",
		},
		-- Layout configuration
		layout = {
			spacing = 3,
			align = "center",
		},
		-- Icons configuration (uses nvim-web-devicons)
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
			ellipsis = "…",
			-- Enable proper icon display
			mappings = true,
			rules = {},
			-- Show icons from nvim-web-devicons
			keys = {
				Up = "󰁝",
				Down = "󰁅",
				Left = "󰁍",
				Right = "󰁔",
				C = "󰘴 ",
				M = "󰘵 ",
				D = "󰘳 ",
				S = "󰘶 ",
				CR = "󰌑 ",
				Esc = "󱊷 ",
				ScrollWheelDown = " ",
				ScrollWheelUp = " ",
				NL = "󰌑 ",
				BS = "󰌍 ",
				Space = "󱁐 ",
				Tab = "󰌒 ",
				F1 = "󱊫",
				F2 = "󱊬",
				F3 = "󱊭",
				F4 = "󱊮",
				F5 = "󱊯",
				F6 = "󱊰",
				F7 = "󱊱",
				F8 = "󱊲",
				F9 = "󱊳",
				F10 = "󱊴",
				F11 = "󱊵",
				F12 = "󱊶",
			},
		},
		-- Disable which-key for certain file types and buffer types
		disable = {
			ft = { "TelescopePrompt" },
			bt = {}, -- Empty buffers are allowed
		},
		-- Show hidden mappings
		show_help = true,
		show_keys = true,
		-- Triggers - when which-key opens automatically
		triggers = {
			{ "<auto>", mode = "nixsotc" },
		},
		-- Filter function to exclude certain mappings
		filter = function(mapping)
			-- exclude mappings without a description
			return mapping.desc and mapping.desc ~= ""
		end,
		-- Replace key labels
		replace = {
			key = {
				{ "<Space>", "SPC" },
				{ "<CR>", "RET" },
				{ "<Tab>", "TAB" },
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Register key groups
		wk.add({
			{ "<leader>c", group = "code", icon = "󰵮 " },
			{ "<leader>d", group = "debug", icon = "󰨯" },
			{ "<leader>f", group = "find", icon = "󱎸 " },
			{ "<leader>g", group = "git", icon = "󰊢 " },
			{ "<leader>l", group = "lsp", icon = "󰅳 " },
			{ "<leader>q", group = "quit/session", icon = "󰩈 " },
			{ "<leader>s", group = "search", icon = "󰍉" },
			{ "<leader>t", group = "tabs", icon = "󰓩" },
			{ "<leader>u", group = "ui", icon = "󰣆" },
			{ "<leader>w", group = "windows", icon = "󰖲" },
			{ "<leader>b", group = "buffers", icon = "󰖱" },
			{ "<leader>x", group = "trouble", icon = "󰀦" },

			-- Individual keymaps with icons
			{ "<leader>uh", desc = "Clear search highlights", icon = "󰅖" },
			{ "<leader>w", desc = "save", icon = "󰆓" },
			{ "<leader>qqq", desc = "quit all", icon = "󰿅 " },
			{ "<leader>cp", desc = "Copy file path", icon = "󰆏" },
			{ "<leader>+", desc = "Increment number", icon = "󰐕" },
			{ "<leader>-", desc = "Decrement number", icon = "󰍴" },
			{ "<leader>sv", desc = "Split window vertically", icon = "󰯌" },
			{ "<leader>sh", desc = "Split window horizontally", icon = "󰯋" },
			{ "<leader>se", desc = "Make splits equal size", icon = "󰘞 " },
			{ "<leader>sx", desc = "Close current split", icon = "󰅖" },
			{ "<leader>sm", desc = "Toggle split window maximization", icon = "󰖯 " },
			{ "<leader>to", desc = "Open new tab", icon = "󰓩 " },
			{ "<leader>tx", desc = "Close current tab", icon = "󰭌 " },
			{ "<leader>tn", desc = "Go to next tab", icon = " " },
			{ "<leader>tp", desc = "Go to previous tab", icon = " " },
			{ "<leader>tf", desc = "Open current buffer in new tab", icon = " " },

			-- Plugin keymaps with icons (from other files)
			{ "<leader>e", desc = "Toggle file explorer", icon = "󰙅" },
			{ "<leader>gg", desc = "Open lazygit", icon = "󰊢" },
			{ "<leader>?", desc = "Buffer Local Keymaps", icon = "?" },

			-- Telescope keymaps
			{ "<leader>ff", desc = "Find Files", icon = "󰈞" },
			{ "<leader>fg", desc = "Find Git Files", icon = "󰊢" },
			{ "<leader>fr", desc = "Recent", icon = "󰋚" },
			{ "<leader>fb", desc = "Buffers", icon = "󰖱" },

			-- Debug keymaps
			{ "<leader>db", desc = "Toggle breakpoint", icon = "󰆹" },
			{ "<leader>dc", desc = "Debugger Continue", icon = "󰆷" },
			{ "<leader>dx", desc = "Terminate debugger", icon = "󰆸" },
			{ "<leader>de", desc = "Evaluate variable under cursor", icon = "󰇀" },
			{ "<leader>dt", desc = "Toggle debugger UI", icon = "󰖯" },

			-- Harpoon keymaps
			{ "<leader>1", desc = "Harpoon 1", icon = "󰬺" },
			{ "<leader>2", desc = "Harpoon 2", icon = "󰬻" },
			{ "<leader>3", desc = "Harpoon 3", icon = "󰬼" },
			{ "<leader>4", desc = "Harpoon 4", icon = "󰬽" },
			{ "<leader>5", desc = "Harpoon 5", icon = "󰬾" },
		})

		-- Custom highlights for aesthetic
		vim.api.nvim_set_hl(0, "WhichKey", { fg = "#7aa2f7", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#bb9af7", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#a9b1d6", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#565f89", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "#161616" })
		vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#393939" })
		vim.api.nvim_set_hl(0, "WhichKeyIcon", { fg = "#7dcfff", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconAzure", { fg = "#7dcfff", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconBlue", { fg = "#7aa2f7", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconCyan", { fg = "#7dcfff", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconGreen", { fg = "#9ece6a", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconGrey", { fg = "#565f89", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconOrange", { fg = "#ff9e64", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconPurple", { fg = "#bb9af7", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconRed", { fg = "#f7768e", underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyIconYellow", { fg = "#e0af68", underline = false })
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
