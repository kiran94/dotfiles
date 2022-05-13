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
			},
		},
	})

	-- EXTENSIONS
	local projectInstalled, _ = pcall(require, "project_nvim")
	if projectInstalled then
		telescope.load_extension("projects")
	end

	local neoclipInstalled, _ = pcall(require, "neoclip")
	if neoclipInstalled then
		telescope.load_extension("neoclip")
	end
end

return options
