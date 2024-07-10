return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	event = "VeryLazy",
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
			"codelldb",
			"hyprls",
		},
		auto_update = false,
		run_on_start = true,
	},
	build = function()
		vim.cmd("MasonToolsInstall")
	end,
}
