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
			suggestion = {
				enabled = true,
				auto_trigger = false,
			},
			panel = {
				enabled = true,
				auto_refresh = true,
			},
		})

		require("copilot_cmp").setup()
	end,
}
