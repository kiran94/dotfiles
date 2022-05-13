local options = {}

options.config = function()
	local ok, hlslens = pcall(require, "hlslens")
	if not ok then
		return
	end

	hlslens.setup({
		nearest_only = true,
	})
end

return options
