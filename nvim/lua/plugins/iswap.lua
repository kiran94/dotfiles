return {
	"mizlan/iswap.nvim",
	event = "BufWinEnter",
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {
		-- Automatically swap with only two arguments
		autoswap = true,
	},
}
