local options = {}

options.config = function()
	require("formatter").setup({
		filetype = {
			------------------
			-- LUA
			------------------
			lua = {
				function()
					-- https://www.npmjs.com/package/lua-fmt
					return {
						exe = "luafmt",
						args = { "--indent-count", 4, "--stdin" },
						stdin = true,
					}
				end,
			},
			------------------
			-- TERRAFORM
			------------------
			terraform = {
				function()
					return {
						exe = "terraform",
						args = { "fmt", "-" },
						stdin = true,
					}
				end,
			},
			------------------
			-- PYTHON
			------------------
			python = {
				function()
					return {
						exe = "python -m autopep8",
						args = {
							"--in-place --aggressive --aggressive",
							vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						},
						stdin = false,
					}
				end,
			},
			------------------
			-- JSON
			------------------
			json = {
				function()
					return {
						exe = "jq",
						stdin = true,
					}
				end,
			},
			------------------
			-- GO
			------------------
			go = {
				function()
					return {
						exec = "gofmt",
						args = {
							"-w",
							vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						},
						stdin = false,
					}
				end,
			},
			------------------
			-- YAML
			------------------
			yaml = {
				function()
					return {
						exec = "yq",
						stdin = false,
					}
				end,
			},
		},
	})
end

return options
