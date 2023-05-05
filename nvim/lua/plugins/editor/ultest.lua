local options = {}

options.config = function()
	require("neotest").setup({
		adapters = {
			require("neotest-python")({ dap = { justMyCode = false } }),
			require("neotest-go"),
			require("neotest-plenary"),
		},
        quickfix = {
            enabled = false,
        }
	})
end

return options
