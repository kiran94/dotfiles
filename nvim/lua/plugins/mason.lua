return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			-- LSPs
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
			-- LINTER & FORMATTING
			-- "flake8",
			-- "isort",
			-- "autopep8",
			-- "goimports",
			-- "gofmt",
			-- "staticcheck",
			-- "stylua",
			-- "clang-format",
			-- "jq" ,
			-- "yamllint",
			-- "yamlfmt",
			-- DAPS
			-- "debugpy",
			-- "delve",
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
