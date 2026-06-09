return {
	"ThePrimeagen/harpoon",

	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, { buffer = cx.bufnr })
			end,
		})

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- Ultra-fast access with comma
		vim.keymap.set("n", "<leader>,", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon menu" })

		-- Jump group for Harpoon management
		vim.keymap.set("n", "<leader>ja", function()
			harpoon:list():add()
		end, { desc = "Add file to Harpoon" })

		vim.keymap.set("n", "<leader>jd", function()
			harpoon:list():remove()
		end, { desc = "Remove file from Harpoon" })

		vim.keymap.set("n", "<leader>jc", function()
			harpoon:list():clear()
		end, { desc = "Clear Harpoon list" })

		vim.keymap.set("n", "<leader>jn", function()
			harpoon:list():next()
		end, { desc = "Next Harpoon" })

		vim.keymap.set("n", "<leader>jp", function()
			harpoon:list():prev()
		end, { desc = "Previous Harpoon" })

		-- Direct number jumps (1-9)
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end, { desc = "Harpoon " .. i })
		end

		-- Alternative with C-e for those who prefer it
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon menu" })

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>jt", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Harpoon Telescope" })
	end,
}