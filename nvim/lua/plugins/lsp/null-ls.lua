local options = {}

options.config = function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local actions = null_ls.builtins.code_actions

	null_ls.setup({
		sources = {
			-- Python
			formatting.autopep8,
			formatting.isort,
			diagnostics.flake8,
			-- diagnostics.pyproject_flake8,

			-- Go
			formatting.gofmt,
			formatting.goimports,
			-- formatting.golines,
			diagnostics.staticcheck,

			-- Lua
			-- formatting.lua_format,
			formatting.stylua,

			-- Others
			formatting.terraform_fmt,
			formatting.clang_format,
			formatting.yamlfmt,
			diagnostics.yamllint,
			actions.refactoring,

			-- JavaScript
			-- formatting.eslint,
			-- formatting.prettier,
			-- formatting.json_tool,
			formatting.jq,

			-- Rust
			formatting.rustfmt,
		},
	})
end

return options
