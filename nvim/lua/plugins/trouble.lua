return {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	cmd = "TroubleToggle",
	opts = {
		use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
	},
}
