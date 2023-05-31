local M = {}

M.config = function()
	require("scrollview").setup({
		excluded_filetypes = { "NvimTree" },
		signs_on_startup = { "all" },
		current_only = true,
	})
end

return M
