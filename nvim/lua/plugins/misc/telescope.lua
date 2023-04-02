local options = {}

options.config = function()
	local telescope = require("telescope")

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
		},
		extensions = {
			["ui-select"] = { require("telescope.themes").get_dropdown({}) },
		},
	})

	-- EXTENSIONS
	pcall(telescope.load_extension, "project_nvim")
	pcall(telescope.load_extension, "neoclip")
	pcall(telescope.load_extension, "fzf")
	pcall(telescope.load_extension, "ui-select")
end

return options
