return {
	"neovim/nvim-lspconfig",
	config = require("plugins/lsp/lsp-installer").config,
	lazy = false,
	dependencies = {
		"onsails/lspkind-nvim",
		"ray-x/lsp_signature.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua", -- ft = lua
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"davidsierradz/cmp-conventionalcommits", -- ft = gitcommit
		"folke/lsp-colors.nvim",
		"b0o/SchemaStore.nvim",
		"RRethy/vim-illuminate",
		"Afourcat/treesitter-terraform-doc.nvim",
		{ "j-hui/fidget.nvim", tag = "legacy" }, -- https://github.com/j-hui/fidget.nvim/issues/133
		"lvimuser/lsp-inlayhints.nvim",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
			config = require("plugins/lsp/luasnip").config,
			event = "VeryLazy",
		},
		{
			"SmiteshP/nvim-navic",
			config = require("plugins/lsp/navic").config,
			requires = "neovim/nvim-lspconfig",
		},
	},
}
