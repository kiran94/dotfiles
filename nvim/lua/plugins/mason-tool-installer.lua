return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		ensure_installed = {
			"jsonlint",
			"sqlfluff",
			"shellcheck",
			"goimports",
			"stylua",
			"luacheck",
			"shfmt",
			"staticcheck",
			"clang-format",
			"jq",
			"yamlfmt",
			"csharpier",
			"delve",
			"debugpy",
		},
		auto_update = false,
		run_on_start = true,
	},
}
