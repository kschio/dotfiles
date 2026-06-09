---@diagnostic disable: missing-fields
return {
	{
		"slugbyte/lackluster.nvim",
		priority = 1000,
		init = function()
			local lackluster = require("lackluster")
			lackluster.setup({
				tweak_background = {
					normal = "none",
					popup = "none",
				},
			})
			-- vim.cmd.colorscheme("lackluster-night")
		end,
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				default_integrations = true,
				integrations = {
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
				color_overrides = {
					all = {},
				},
				custom_highlights = {
					LineNr = { fg = "#919191" },
				},
			})

			-- setup must be called before loading
			-- vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	{
		"drewxs/ash.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("ash").setup({
				transparent = true,
				term_colors = true,
			})
			-- vim.cmd.colorscheme("ash")
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true

			-- oxocarbon-light's syntax colors fail contrast on white, and oxocarbon
			-- fills an opaque background. re-apply both on every oxocarbon load so an
			-- implicit reload (nvim reloads the scheme when 'background' changes)
			-- can't leave a half-switched state.
			local function tweak()
				if vim.o.background == "light" then
					-- darken the worst groups to readable Carbon-70 weights.
					local function fg(groups, color)
						for _, g in ipairs(groups) do
							local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
							hl.fg = color
							hl.force = true
							vim.api.nvim_set_hl(0, g, hl)
						end
					end
					fg({ "String", "@string", "@constant" }, "#6929c4")
					fg({ "Function", "@function", "@function.call", "@function.method" }, "#673ab7")
					fg({ "@property" }, "#8a3800")
					fg({ "@punctuation.delimiter", "@punctuation.bracket", "@punctuation.special" }, "#525252")
					fg({
						"Keyword", "Statement", "Conditional", "Repeat", "Operator", "Type", "PreProc",
						"@keyword", "@keyword.function", "@keyword.operator", "@keyword.return",
						"@type", "@type.builtin", "@operator",
					}, "#9f1853")
				end

				-- transparent editor so ghostty's background + blur show through
				-- (floats/popups keep their bg so completion stays readable)
				for _, g in ipairs({
					"Normal", "NormalNC", "SignColumn", "EndOfBuffer",
					"LineNr", "CursorLineNr", "FoldColumn", "MsgArea",
				}) do
					local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
					hl.bg = nil
					hl.ctermbg = nil
					hl.force = true
					vim.api.nvim_set_hl(0, g, hl)
				end
			end

			vim.api.nvim_create_autocmd("ColorScheme", { pattern = "oxocarbon", callback = tweak })
			vim.cmd.colorscheme("oxocarbon")
			vim.cmd("syntax enable")

			-- follow the macOS toggle. theme-sync writes ~/.cache/theme-mode on every
			-- flip. react regardless of focus (a libuv watch) plus on focus (backstop).
			local mode_file = vim.fn.expand("~/.cache/theme-mode")
			local function sync()
				local ok, lines = pcall(vim.fn.readfile, mode_file)
				if not ok then
					return
				end
				local mode = vim.trim(lines[1] or "")
				if (mode == "light" or mode == "dark") and mode ~= vim.o.background then
					vim.o.background = mode
					vim.cmd.colorscheme("oxocarbon")
				end
			end

			local watch = vim.uv.new_fs_event()
			local function arm()
				if not watch or vim.fn.filereadable(mode_file) ~= 1 then
					return
				end
				watch:start(
					mode_file,
					{},
					vim.schedule_wrap(function()
						sync()
						-- re-arm: a truncating write can invalidate the file handle
						watch:stop()
						arm()
					end)
				)
			end
			arm()

			vim.api.nvim_create_autocmd("FocusGained", { callback = sync })
		end,
	},
}
