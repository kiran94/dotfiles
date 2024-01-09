local options = {}

options.config = function()
	require("neo-tree").setup({

		close_if_last_window = true,

		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_by_pattern = {
					".git*",
				},
			},
		},
	})
end

return options
