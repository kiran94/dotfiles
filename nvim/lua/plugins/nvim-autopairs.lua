return {
	"windwp/nvim-autopairs",
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup()

		-- If you want insert `(` after select function or method item
		local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
		if not ok then
			return
		end

		local ok, cmp = pcall(require, "cmp")
		if not ok then
			return
		else
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end
	end,
	event = "BufWinEnter",
}
