local options = {}

options.config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup {
        ensure_installed = "all",
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
