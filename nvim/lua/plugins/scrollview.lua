return {
	"dstein64/nvim-scrollview",
	event = "BufWinEnter",
	opts = {
		excluded_filetypes = { "NvimTree", "neo-tree" },
		signs_on_startup = { "all" },
		current_only = true,
	},
}
