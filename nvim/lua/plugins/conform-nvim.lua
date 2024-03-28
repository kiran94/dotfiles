return {
	"stevearc/conform.nvim",
	event = { "VeryLazy" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "format",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			terraform = { "terraform_fmt" },
			yaml = { "yamlfmt" },
			cs = { "csharpier" },
			sh = { "shfmt" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			java = { "clang_format" },
			cuda = { "clang_format" },
			proto = { "clang_format" },
			json = { "jq" },
			rust = { "rustfmt" },
			sql = { "sqlfluff" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format", "ruff_fix" }
				elseif require("conform").get_formatter_info("black", bufnr).available then
					return { "black" }
				else
					return { "autopep8" }
				end
			end,
		},
	},
}
