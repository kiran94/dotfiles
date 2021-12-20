local options = {}

options.config = function()

    local telescope = require("telescope")

    telescope.setup {
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
                "**/.mypy_cache/*",
                "viml_legacy/"
            }
        }
    }

    -- EXTENSIONS
    local ok, _ = pcall(require, "project_nvim")
    if ok then
        telescope.load_extension('projects')
    end
end

return options
