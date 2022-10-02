local options = {}

options.config = function()
	local notify = require("notify")

	-- plugin integration
	vim.notify = notify

	notify.setup({
		stages = "fade",               -- Animation style (see below for details)
		on_open = nil,                 -- Function called when a new window is opened, use for changing win settings/config
		on_close = nil,                -- Function called when a window is closed
		render = "default",            -- Render function for notifications. See notify-render()
		timeout = 3000,                -- Default timeout for notifications
		background_colour = "#000000", -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
		minimum_width = 50,            -- Minimum width for notification windows

		icons = {
			ERROR = "",
			WARN  = "",
			INFO  = "",
			DEBUG = "",
			TRACE = "✎",
		},
	})
end

return options
