local options = {}

vim.cmd[[highlight GitSignsAdd guifg=Green]]
vim.cmd[[highlight GitSignsDelete guifg=Red]]
vim.cmd[[highlight GitSignsChange guifg=Orange]]

options.config = function()

    local gitsigns = require('gitsigns')
    gitsigns.setup{
        numhl = false,
        linehl = false
    }
end

return options
