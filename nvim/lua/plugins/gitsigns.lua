return {
	"lewis6991/gitsigns.nvim",
	opts = {
		numhl = false,
		linehl = false,
	},
	config = function(plugin, plugin_opts)
		vim.cmd([[highlight GitSignsAdd guifg=Green]])
		vim.cmd([[highlight GitSignsDelete guifg=Red]])
		vim.cmd([[highlight GitSignsChange guifg=Orange]])

		require("gitsigns").setup(plugin_opts)
	end,
	event = "BufRead",
}
