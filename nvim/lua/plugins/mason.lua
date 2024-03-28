return {
	"williamboman/mason-lspconfig.nvim",
	event = "VeryLazy",
	opts = {
		ensure_installed = {
			"lua_ls",
			"pylsp",
			"gopls",
			"terraformls",
			"bashls",
			"yamlls",
			"jsonls",
			"dockerls",
			"docker_compose_language_service",
			"clangd",
			"cmake",
			"taplo",
			"marksman",
		},

		-- TODO: Refactor the below code via setup_handlers
		-- mason_lsp.setup_handlers()

		automatic_installation = true,
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
		},
	},
}
