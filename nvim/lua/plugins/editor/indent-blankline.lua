local options = {}

vim.opt.list = false
vim.opt.listchars:append("space:.")
vim.opt.listchars:append("eol:↴")

options.config = function()
	require("ibl").setup({
		enabled = true,
		scope = {
			enabled = false,
		},
	})
end

return options
