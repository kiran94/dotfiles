return {
	"onsails/lspkind-nvim",
	config = function()
		local lsp_kind = require("lspkind")
		lsp_kind.init({
			mode = "symbol_text",
			symbol_map = {
				Text = "",
				Method = "ƒ",
				Function = "ﬦ",
				Constructor = "",
				Variable = "",
				Class = "",
				Interface = "ﰮ",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "了",
				Keyword = "",
				Snippet = "﬌",
				Color = "",
				File = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				copilot = "",
			},
		})
	end,
}
