return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "luacheck" },
			json = { "jsonlint" },
			sql = { "sqlfluff" },
			sh = { "shellcheck" },
			terraform = { "terraform_validate" },
		}

		local function has_bin(bin)
			return vim.fn.executable(bin) == 1
		end

		if has_bin("ruff") then
			lint.linters_by_ft.python = { "ruff" }
		elseif has_bin("flake8") then
			lint.linters_by_ft.python = { "flake8" }
		end

		if has_bin("eslint_d") then
			lint.linters_by_ft.javascript = { "eslint_d" }
			lint.linters_by_ft.javascriptreact = { "eslint_d" }
			lint.linters_by_ft.typescript = { "eslint_d" }
			lint.linters_by_ft.typescriptreact = { "eslint_d" }
		elseif has_bin("eslint") then
			lint.linters_by_ft.javascript = { "eslint" }
			lint.linters_by_ft.javascriptreact = { "eslint" }
			lint.linters_by_ft.typescript = { "eslint" }
			lint.linters_by_ft.typescriptreact = { "eslint" }
		end

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
