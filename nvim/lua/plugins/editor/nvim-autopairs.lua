local options = {}

options.config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup()

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local ok, cmp = pcall(require, 'cmp')
    if not ok then
        return
    else
        cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
    end
end

return options
