local options = {}

options.config = function()
	require("copilot").setup({
		-- Disabled because we are using copilot cmp
		suggestion = { enabled = false },
		panel = { enabled = false },
	})

	require("copilot_cmp").setup()
end

return options
