local options = {}

options.config = function()
	require("focus").setup({
		-- signcolumn     = true,
		-- number         = true,
		-- relativenumber = true,
	})
end

return options
