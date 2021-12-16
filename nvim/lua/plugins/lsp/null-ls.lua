local options = {}

options.config = function ()

    local null_ls = require('null-ls')
    null_ls.setup({
        sources = {
            -- Python
            null_ls.builtins.formatting.autopep8,
            null_ls.builtins.formatting.isort,
            -- Go
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.formatting.golines,
            -- Lua
            null_ls.builtins.formatting.lua_format,
            -- null_ls.builtins.formatting.stylua,
            -- Others
            null_ls.builtins.formatting.terraform_fmt,
            null_ls.builtins.formatting.clang_format,
            -- JavaScript
            null_ls.builtins.diagnostics.eslint,
            -- null_ls.builtins.diagnostics.prettier,
            null_ls.builtins.formatting.json_tool,
        },
    })
end

return options
