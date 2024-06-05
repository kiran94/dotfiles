return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = "BufWinEnter",
	config = function()
		local telescope = require("telescope")
		local trouble = require("trouble.sources.telescope")

		telescope.setup({
			prompt_position = "bottom",
			defaults = {
				file_ignore_patterns = {
					".env/",
					".venv/",
					".git/",
					".terraform/",
					"node_modules/",
					"bin/",
					"obj/",
					"**/*.png",
					"**/*.jpeg",
					"viml_legacy/",
					"**/.mypy_cache/*",
					"__pycache__/*",
					".pytest_cache/*",
					"vendor/*",
					"**/*.zip",
				},
				mappings = {
					i = { ["<c-q>"] = trouble.open },
					n = { ["<c-q>"] = trouble.open },
				},
			},
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown({}) },
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		-- EXTENSIONS
		pcall(telescope.load_extension, "project_nvim")
		pcall(telescope.load_extension, "neoclip")
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")
	end,
}
