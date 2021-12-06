local options = {}

options.config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup()
end

return options
