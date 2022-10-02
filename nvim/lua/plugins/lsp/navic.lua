local options = {}

options.config = function ()
    vim.g.navic_silence = true
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end

return options
