return {
	"folke/twilight.nvim",
	event = "BufWinEnter",
    enabled = false,
	dependencies = { "nvim-treesitter/nvim-treesitter", "folke/zen-mode.nvim" },
	opts = {
		context = 25,
	},
}
