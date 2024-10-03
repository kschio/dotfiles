return {
	"famiu/bufdelete.nvim",
	config = function()
		vim.keymap.set("n", "<Leader>bd", ":Bdelete<CR>")
	end,
}
