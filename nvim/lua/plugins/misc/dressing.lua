local M = {}

M.config = function()
	require("dressing").setup({
		input = {
			enabled = true,
			start_in_insert = false,
			win_options = {
				winblend = 0,
				wrap = true,
			},
		},
		select = {
			enabled = false,
		},
	})
end

return M
