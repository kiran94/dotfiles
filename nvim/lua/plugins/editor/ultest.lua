local options = {}

options.config = function()

	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				dap = { justMyCode = false },
			}),
		},
	})
end

return options
