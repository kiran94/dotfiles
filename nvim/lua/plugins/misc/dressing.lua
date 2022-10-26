local M = {}

M.config = function()
	require("dressing").setup({
		input = {
			enabled = true,
			insert_only = false,
			start_in_insert = false,
			mapping = false,
		},
		select = {
			enabled = false,
		},
	})
end

return M
