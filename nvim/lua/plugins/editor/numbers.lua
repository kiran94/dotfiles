local options = {}

options.config = function()
	require("numbers").setup({
		excluded_filetypes = { "alpha", "NvimTree" },
	})
end

return options
