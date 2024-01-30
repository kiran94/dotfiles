return {
	"nvim-neotest/neotest",
	event = "BufWinEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-plenary",
		"Issafalcon/neotest-dotnet",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({ dap = { justMyCode = false } }),
				require("neotest-go"),
				require("neotest-plenary"),
				require("neotest-dotnet")({ dap = { justMyCode = false }}),
			},
			quickfix = {
				enabled = false,
			},
		})
	end,
}
