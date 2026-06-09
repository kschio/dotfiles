return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- Custom mode names
		local mode_map = {
			["n"] = "RW",
			["no"] = "RO",
			["v"] = "**",
			["V"] = "**",
			[""] = "**",
			["s"] = "S",
			["S"] = "SL",
			[""] = "SB",
			["i"] = "**",
			["ic"] = "**",
			["R"] = "RA",
			["Rv"] = "RV",
			["c"] = "VIEX",
			["cv"] = "VIEX",
			["ce"] = "EX",
			["r"] = "r",
			["rm"] = "r",
			["r?"] = "r",
			["!"] = "!",
			["t"] = "",
		}

		-- Custom mode component
		local function custom_mode()
			local mode = vim.fn.mode()
			return mode_map[mode] or mode:upper()
		end

		-- Git branch component with lambda style
		local function git_branch()
			local branch = vim.b.gitsigns_status_dict
			if branch and branch.head and branch.head ~= "" then
				return string.format("(λ • #%s)", branch.head)
			end
			return ""
		end

		-- Buffer number component
		local function bufnr()
			return tostring(vim.api.nvim_get_current_buf())
		end

		-- Search count component
		local function searchcount()
			if vim.v.hlsearch == 0 then
				return ""
			end
			local ok, count = pcall(vim.fn.searchcount, { recompute = true })
			if not ok or count.current == nil or count.total == 0 then
				return ""
			end
			if count.incomplete == 1 then
				return "?/?"
			end
			local too_many = string.format(">%d", count.maxcount)
			local total = count.total > count.maxcount and too_many or count.total
			return string.format("%s matches", total)
		end

		-- Custom diagnostics formatting
		local function diagnostics_component()
			return {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = "", warn = "", info = "", hint = "" },
				diagnostics_color = {
					error = { fg = "#ee5396" },
					warn = { fg = "#f9e2af" },
					info = { fg = "#82c7a5" },
					hint = { fg = "#82c7a5" },
				},
				separator = "",
				update_in_insert = false,
				always_visible = false,
			}
		end

		lualine.setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						custom_mode,
						padding = { left = 1, right = 1 },
						color = function()
							local mode = vim.fn.mode()
							if mode == "n" then
								return { fg = "#161616", bg = "#82c7a5", gui = "bold" }
							elseif mode == "i" or mode == "ic" then
								return { fg = "#161616", bg = "#82c7ff", gui = "bold" }
							elseif mode == "v" or mode == "V" or mode == "" then
								return { fg = "#161616", bg = "#f9e2af", gui = "bold" }
							elseif mode == "R" then
								return { fg = "#161616", bg = "#ee5396", gui = "bold" }
							elseif mode == "c" then
								return { fg = "#161616", bg = "#c1a6ff", gui = "bold" }
							elseif mode == "t" then
								return { fg = "#161616", bg = "#78a9ff", gui = "bold" }
							else
								return { fg = "#dde1e6", bg = "#262626", gui = "bold" }
							end
						end,
					},
				},
				lualine_b = {
					{
						"filename",
						file_status = false,
						path = 0,
						symbols = {
							modified = "",
							readonly = "",
							unnamed = " ksch-nvim",
							newfile = "",
						},
						padding = { left = 1, right = 1 },
					},
					{
						git_branch,
						color = { fg = "#78a9ff" },
						padding = { left = 0, right = 1 },
					},
					{
						bufnr,
						color = { fg = "#525252" },
						padding = { left = 0, right = 0 },
					},
				},
				lualine_c = {},
				lualine_x = {
					diagnostics_component(),
					{
						"filetype",
						colored = false,
						icon_only = false,
						padding = { left = 1, right = 1 },
					},
					{
						searchcount,
						padding = { left = 1, right = 1 },
					},
				},
				lualine_y = {},
				lualine_z = {
					{
						"location",
						padding = { left = 1, right = 1 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})

		-- Set cmdheight to 0 for cleaner look
		vim.opt.cmdheight = 0
		vim.opt.laststatus = 3
	end,
}
