return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {
		enabled = true,
		scope = {
			enabled = false,
		},
	},
	config = function(plugin, opts)
		vim.opt.list = false
		vim.opt.listchars:append("space:.")
		vim.opt.listchars:append("eol:↴")
		require("ibl").setup(opts)
	end,
    event = "BufWinEnter"
}
