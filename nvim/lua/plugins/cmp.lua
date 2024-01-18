return {
	"hrsh7th/cmp-nvim-lsp",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lua", -- ft = lua
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"davidsierradz/cmp-conventionalcommits", -- ft = gitcommit
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lsp_kind = require("lspkind")

		local t = function(str)
			return vim.api.nvim_replace_termcodes(str, true, true, true)
		end

		local check_back_space = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
		end

		-- Editor Completion
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 10 },
				{ name = "nvim_lua", max_item_count = 25 },
				{ name = "buffer", max_item_count = 5 },
				{ name = "luasnip", max_item_count = 10 },
				{ name = "treesitter", max_item_count = 5 },
				{ name = "path", max_item_count = 5 },
				{ name = "spell", max_item_count = 5 },
				{ name = "calc", max_item_count = 5 },
				{ name = "emoji", max_item_count = 5 },
				{ name = "copilot", max_item_count = 5 },
				{ name = "nvim_lsp_signature_help" },
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				["<TAB>"] = cmp.mapping(function(fallback)
					-- If the pop up menu is open then map to next item in the list
					if vim.fn.pumvisible() == 1 then
						vim.fn.feedkeys(t("<C-n>"), "n")
					-- If we are in the middle of neogen generation then hump to next
					-- elseif neogen ~= nil and neogen.jumpable() then
					--     vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
					elseif check_back_space() then
						vim.fn.feedkeys(t("<tab>"), "n")
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			formatting = {
				format = function(entry, vim_item)
					local menu_dict = {
						nvim_lsp = "ﲳ",
						nvim_lua = "",
						treesitter = "",
						path = "ﱮ",
						buffer = "﬘",
						zsh = "",
						luasnip = "",
						spell = "暈",
						copilot = "",
					}

					local menu_literal = {
						nvim_lsp = "[LSP]",
						nvim_lua = "[LUA]",
						treesitter = "[TREE]",
						path = "[PATH]",
						buffer = "[BUFF]",
						zsh = "[ZSH]",
						luasnip = "[SNIP]",
						spell = "[SPELL]",
						copilot = "[GITHUB]",
					}

					vim_item.kind =
						string.format("%s %s", lsp_kind.presets.default[vim_item.kind] or "", vim_item.kind or "")
					vim_item.menu = string.format(
						"%s %s",
						menu_dict[entry.source.name] or "",
						menu_literal[entry.source.name] or ""
					)
					return vim_item
				end,
			},
			documentaton = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			},
		})

		-- Cmd Completion
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "cmdline", max_item_count = 20 },
			}),
		})

		-- Cmd Completion (Search)
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer", max_item_count = 5 },
			},
		})
	end,
}
