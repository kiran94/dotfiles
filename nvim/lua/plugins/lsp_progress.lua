return {
	"linrongbin16/lsp-progress.nvim",
	opts = {
		max_size = 100,
		format = function(client_messages)
			local sign = "" --  LSP
			if #client_messages > 0 then
				return sign .. " " .. table.concat(client_messages, " ")
			end

			if #vim.lsp.get_active_clients() > 0 then
				return sign
			end

			return ""
		end,
	},
}
