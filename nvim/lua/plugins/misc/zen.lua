local options = {}

options.twilight_config = function()
	require("twilight").setup({
		context = 25,
	})
end

return options
