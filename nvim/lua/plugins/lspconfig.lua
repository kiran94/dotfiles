return {
	"neovim/nvim-lspconfig",
	config = require("plugins/lsp/lsp-installer").config,
	lazy = false,
	dependencies = {
		"onsails/lspkind-nvim",
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
		"b0o/SchemaStore.nvim",
		"RRethy/vim-illuminate",
		"Afourcat/treesitter-terraform-doc.nvim",
		"lvimuser/lsp-inlayhints.nvim",
		"SmiteshP/nvim-navic",
	},
}
