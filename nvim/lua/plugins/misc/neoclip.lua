local options = {}

options.config = function()
	require("neoclip").setup({

		history = 50,
		enable_persistent_history = false,
		preview = false,
		-- keys = {
		-- telescope = {
		--    i = {
		--          select = '<cr>',
		--          paste = '<cr>',
		--          paste_behind = '<c-k>',
		--          custom = {},
		--        },
		--  },
		-- }
	})


    vim.keymap.set('n', '<M-q>', function() telescope().extensions.neoclip.default() end)
end

return options
