local options = {}

options.config = function()
	require("git-conflict").setup()
end

return options
