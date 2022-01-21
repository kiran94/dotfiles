local options = {}

options.config = function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		sources = {
			-- Python
			formatting.autopep8,
			formatting.isort,
			diagnostics.flake8,

			-- Go
			formatting.gofmt,
			formatting.goimports,
			-- formatting.golines,

			-- Lua
			-- formatting.lua_format,
			formatting.stylua,

			-- Others
			formatting.terraform_fmt,
			formatting.clang_format,

			-- JavaScript
			-- formatting.eslint,
			-- formatting.prettier,
			formatting.json_tool,
		},
	})
end

return options
