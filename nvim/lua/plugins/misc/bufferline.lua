local options = {}

options.config = function()

    require("bufferline").setup{
      diagnostics = "nvim_lsp"
    }
end

return options
