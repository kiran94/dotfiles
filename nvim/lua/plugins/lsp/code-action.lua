local options = {}

options.config = function()
    vim.g.code_action_menu_show_details = false
    vim.g.code_action_menu_show_diff = false
end

return options
