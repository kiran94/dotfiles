local options = {}

vim.opt.list = false
vim.opt.listchars:append("space:.")
vim.opt.listchars:append("eol:↴")

options.config = function()
	require("indent_blankline").setup({
		show_end_of_line = true,
		space_char_blankline = " ",
		show_current_context_start = false,
		show_current_context = false,
		buftype_exclude = { "terminal", "nofile" },
		filetype_exclude = { "alpha", "NvimTree", "packer", "help" },
	})
end

return options
