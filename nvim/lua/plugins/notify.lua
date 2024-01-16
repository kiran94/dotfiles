return {
	"rcarriga/nvim-notify",
	event = "BufWinEnter",
	opts = {
		stages = "fade", -- Animation style (see below for details)
		on_open = nil, -- Function called when a new window is opened, use for changing win settings/config
		on_close = nil, -- Function called when a window is closed
		render = "minimal", -- Render function for notifications. See notify-render()
		timeout = 3000, -- Default timeout for notifications
		background_colour = "#000000", -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
		minimum_width = 50, -- Minimum width for notification windows

		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
	},
	config = function(plugin, opts)
		local notify = require("notify")

		notify.setup(opts)
		vim.notify = notify
	end,
}
