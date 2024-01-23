return {
	"nvimtools/none-ls.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local actions = null_ls.builtins.code_actions

		null_ls.setup({
			sources = {
				-- Python
				-- formatting.autopep8,
				-- formatting.isort,
				-- diagnostics.flake8,
				-- diagnostics.pyproject_flake8,
				-- diagnostics.ruff,
				formatting.ruff,

				-- Go
				formatting.gofmt,
				formatting.goimports,
				-- formatting.golines,
				actions.gomodifytags,
				diagnostics.staticcheck,

				-- Lua
				-- formatting.lua_format,
				formatting.stylua,

				-- Others
				formatting.terraform_fmt,
				formatting.yamlfmt,
				formatting.csharpier,
				formatting.beautysh,
				diagnostics.yamllint,
				actions.refactoring,
				formatting.clang_format.with({ filetypes = { "c", "cpp", "java", "cuda", "proto" } }),

				-- diagnostics.cspell.with({ filetypes = { "markdown", "text" } }),
				-- actions.cspell.with({ filetypes = { "markdown", "text" } }),

				-- JavaScript
				-- formatting.eslint,
				-- formatting.prettier,
				-- formatting.json_tool,
				formatting.jq,

				-- Rust
				formatting.rustfmt,
			},
			on_attach = function()
				-- NOTE: This is duplicated with lsp-installer
				vim.diagnostic.config({
					virtual_text = false,
					underline = false,
					signs = true,
					update_in_insert = true,
					float = { border = "rounded" },
				})
			end,
		})
	end,
}
