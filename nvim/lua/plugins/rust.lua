return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	lazy = false, -- This plugin is already lazy
	init = function()
		-- rustaceanvim owns the rust-analyzer client; configuring it through
		-- nvim-lspconfig as well would start competing clients.
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end
				end,
				default_settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
					},
				},
			},
		}
	end,
}
