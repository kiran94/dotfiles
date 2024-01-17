return {
	"AckslD/nvim-neoclip.lua",
    enabled = false,
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {

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
	},
	config = function(plugin, opts)
		require("neoclip").setup(opts)

		local telescope = require("telescope")

		vim.keymap.set("n", "<M-q>", function()
			telescope().extensions.neoclip.default()
		end)
	end,
}
