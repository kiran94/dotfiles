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
				formatting.gofmt,
				formatting.goimports,
				formatting.stylua,
				formatting.terraform_fmt,
				formatting.yamlfmt,
				formatting.csharpier,
				formatting.shfmt,
				formatting.clang_format.with({ filetypes = { "c", "cpp", "java", "cuda", "proto" } }),
				diagnostics.staticcheck,
				diagnostics.yamllint,
				actions.gomodifytags,
				actions.refactoring,
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
