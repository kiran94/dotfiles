local options = {}

--[[
-- Needed to run the following to get this plugin to work
-- :call mkdp#util#install()
--]]

options.config = function()
    vim.cmd[[let g:mkdp_browser = 'brave']]
end

return options
