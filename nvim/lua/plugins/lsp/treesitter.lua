local options = {}

options.config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup {
        ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = {}, -- List of parsers to ignore installing
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = {} -- list of language that will be disabled
        },
        indent = {
            enable = true
        }
    }
end

return options
