local options = {}

options.config = function()
	local treesitter = require("nvim-treesitter.configs")
	local iswapOk, iswap = pcall(require, "iswap")

	treesitter.setup({
		ensure_installed = "all",
		ignore_install = {}, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
		},
		indent = {
			enable = true,
		},
	})

	if iswapOk then
		iswap.setup({
			-- Automatically swap with only two arguments
			autoswap = true,
		})
	end
end

return options
