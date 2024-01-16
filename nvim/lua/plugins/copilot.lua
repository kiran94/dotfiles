return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	dependencies = {
		"AndreM222/copilot-lualine",
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		require("copilot").setup({
			-- Disabled because we are using copilot cmp
			suggestion = { enabled = false },
			panel = { enabled = false },
		})

		require("copilot_cmp").setup()
	end,
}
