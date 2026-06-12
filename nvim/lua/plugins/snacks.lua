return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		bigfile = {
			enabled = true,
		},
		dashboard = {
			enabled = true,
			preset = {
				header = [[
                                                     
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                     ]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":Telescope find_files cwd=~/.config/dotfiles/nvim",
					},
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					limit = 8,
					padding = { 2, 1 },
				},
				{ section = "startup" },
			},
		},
		dim = {
			enabled = true,
		},
		notifier = {
			enabled = true,
			timeout = 3000,
			style = "minimal",
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = "✎ ",
			},
		},
		scroll = {
			enabled = true,
		},
		words = {
			enabled = true,
		},
		zen = {
			enabled = true,
			toggles = {
				dim = true,
				git_signs = false,
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				vim.notify = Snacks.notifier
			end,
		})
	end,
}
