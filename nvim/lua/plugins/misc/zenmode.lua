local M = {}

M.config = function()
	require("zen-mode").setup({
		tmux = { enabled = true },
	})
end


M.twilight_config = function()
	require("twilight").setup({
		-- context = 25,
	})
end

return M
