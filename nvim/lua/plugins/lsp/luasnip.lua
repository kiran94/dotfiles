local options = {}

options.config = function()
	require("luasnip.loaders.from_vscode").lazy_load()
end

return options
