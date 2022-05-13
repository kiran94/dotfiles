local options = {}

options.config = function()
	require("surround").setup({
		mappings_style = "sandwich",
	})
end

return options
