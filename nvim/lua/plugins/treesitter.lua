return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
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
			"markdown",
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
		sync_install = true,
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = function(lang, bufnr)
				return lang == "markdown" and vim.bo[bufnr].buftype == "nofile"
			end,
		},
		indent = {
			enable = true,
		},
	},
	event = "BufWinEnter",
	config = function(plugin, opts)
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup(opts)

		local query = require("vim.treesitter.query")
		local language_aliases = {
			ex = "elixir",
			pl = "perl",
			sh = "bash",
			ts = "typescript",
		}

		local function get_capture_node(match, capture_id)
			local node = match[capture_id]
			if type(node) == "table" and type(node.range) ~= "function" then
				node = node[1] or node.node
				if type(node) == "table" and node.node then
					node = node.node
				end
			end

			if node and type(node.range) == "function" then
				return node
			end
		end

		query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
			local node = get_capture_node(match, pred[2])
			if not node then
				return
			end

			local alias = vim.treesitter.get_node_text(node, bufnr):lower()
			metadata["injection.language"] = vim.filetype.match({ filename = "a." .. alias }) or language_aliases[alias] or alias
		end, { force = true, all = false })
	end,
}
