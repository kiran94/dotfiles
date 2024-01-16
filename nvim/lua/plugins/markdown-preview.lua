return {
	"iamcco/markdown-preview.nvim",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	ft = { "markdown" },
	config = function()
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

		local browser = get_browser()
		vim.cmd([[let g:mkdp_browser = browser]])
	end,
}
