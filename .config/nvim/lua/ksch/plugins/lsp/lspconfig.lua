return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- Go to navigation (non-leader)
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Go to implementation"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Go to type definition"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "Peek type definition"
				keymap.set("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>", opts)

				-- Code actions (c for code)
				opts.desc = "Code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Code rename"
				keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

				opts.desc = "Code format"
				keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)

				-- LSP info (l for LSP)
				opts.desc = "LSP buffer diagnostics"
				keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "LSP line diagnostics"
				keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

				opts.desc = "LSP workspace diagnostics"
				keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics<CR>", opts)

				opts.desc = "LSP info"
				keymap.set("n", "<leader>lI", "<cmd>LspInfo<CR>", opts)

				opts.desc = "LSP restart"
				keymap.set("n", "<leader>lR", ":LspRestart<CR>", opts)

				-- Diagnostic navigation (bracket navigation)
				opts.desc = "Previous diagnostic"
				keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

				opts.desc = "Next diagnostic"
				keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

				-- Documentation
				opts.desc = "Hover documentation"
				keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

				-- UI toggles
				opts.desc = "Toggle inlay hints"
				keymap.set("n", "<leader>ui", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, opts)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.diagnostic.config({ virtual_text = true })
		-- Set underlines and undercurl for diagnostics to make them stand out
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, undercurl = true, sp = "Red" })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, undercurl = true, sp = "Yellow" })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true, undercurl = true, sp = "Blue" })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = true, undercurl = true, sp = "Green" })

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "󰠠",
					[vim.diagnostic.severity.HINT] = "",
				},
				numhl = {
					[vim.diagnostic.severity.WARN] = "WarningMsg",
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				},
			},
		})

		require("mason-lspconfig").setup({
			automatic_enable = true,
			ensure_installed = {
				"basedpyright",
				"ruff",
				"vtsls",
			},
		})

		vim.lsp.config("basedpyright", {
			capabilities = capabilities,
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "basic",
					},
				},
			},
		})
		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			filetypes = {
				"html",
				"typescriptreact",
				"markdown",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"svelte",
			},
		})
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}