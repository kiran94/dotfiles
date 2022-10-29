local M = {}

M.config = function()
	require("noice").setup({
		cmdline = {
			enabled = true,
		},
		messages = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = false,
			},
		},
	})
end

return M
