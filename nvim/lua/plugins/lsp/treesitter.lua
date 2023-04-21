local options = {}

options.config = function()
	local treesitter = require("nvim-treesitter.configs")
	local iswapOk, iswap = pcall(require, "iswap")

	treesitter.setup({
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"c_sharp",
			"cmake",
			"comment",
			"cpp",
			"css",
			"dart",
			"diff",
			"dockerfile",
			"erlang",
			"fish",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"gitcommit",
			"go",
			"gomod",
			"gosum",
			"graphql",
			"hcl",
			"html",
			"http",
			"ini",
			"java",
			"javascript",
			"jq",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"julia",
			"kotlin",
			"latex",
			"luadoc",
			"luap",
			"make",
			-- "markdown",
			"markdown_inline",
			"nix",
			"passwd",
			"perl",
			"php",
			"proto",
			"python",
			"regex",
			"rst",
			"ruby",
			"rust",
			"scala",
			"scss",
			"sql",
			"terraform",
			"toml",
			"tsx",
			"typescript",
			"vue",
			"yaml",
		},
		ignore_install = {}, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
		},
		indent = {
			enable = true,
		},
	})

	if iswapOk then
		iswap.setup({
			-- Automatically swap with only two arguments
			autoswap = true,
		})
	end
end

return options
