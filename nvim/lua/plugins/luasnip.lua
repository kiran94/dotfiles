return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	event = "VeryLazy",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
		vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
		vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
		vim.api.nvim_set_keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local fmt = require("luasnip.extras.fmt").fmt
		local rep = require("luasnip.extras").rep

		ls.add_snippets("json", {
			s(
				"debug_start",
				fmt(
					[[
                {{
                    "version": "0.2.0",
                    "configurations": [{}]
                }}
                ]],
					{ i(0) }
				)
			),
			s(
				"debug_python_file",
				fmt(
					[[
                {{
                  "name": "Python: Current File",
                  "type": "python",
                  "request": "launch",
                  "module": "${{file}}",
                  "console": "integratedTerminal",
                  "justMyCode": true,
                  "envFile": "${{workspaceFolder}}/.env",
                  "env": {{}}
                  "args": {{}}
                }}
                ]],
					{}
				)
			),
			s(
				"debug_python_module",
				fmt(
					[[
                {{
                    "name": "Python: Module",
                    "type": "python",
                    "request": "launch",
                    "module": "{}",
                    "console": "integratedTerminal",
                    "justMyCode": true,
                    "envFile": "${{workspaceFolder}}/.env",
                    "env": {{}}
                    "args": {{}}
                }}
                ]],
					{ i(0, "module") }
				)
			),
		})
	end,
}
