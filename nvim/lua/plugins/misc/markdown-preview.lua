local options = {}
local os = require("os")

---Gets the User Defined Browser from the Environment
-- Or Defaults to brave
local get_browser = function()
	local user_browser = os.getenv("BROWSER")
	local default_browser = "brave"

	if user_browser == nil or user_browser == "" then
		return default_browser
	else
		return user_browser
	end
end

--[[
-- Needed to run the following to get this plugin to work
-- :call mkdp#util#install()
--]]
options.config = function()
	local browser = get_browser()
	vim.cmd([[let g:mkdp_browser = browser]])
end

return options
