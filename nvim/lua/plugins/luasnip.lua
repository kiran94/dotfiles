return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
		vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
		vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
		vim.api.nvim_set_keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
	end,
}
