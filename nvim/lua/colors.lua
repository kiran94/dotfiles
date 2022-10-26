vim.g.vscode_style = "dark"
local colorscheme = "vscode"

-- Safely attempt to set the colorscheme
-- if not installed then just notify
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
end

vim.cmd [[highlight TelescopeMatching guifg=#8b0000]]
vim.cmd [[highlight Search guibg=Yellow guifg=Black gui=NONE]]
vim.cmd [[highlight Visual guifg=Black guibg=Orange gui=none]]
vim.cmd [[highlight LspSagaCodeActionContent guifg=White gui=none]]
vim.cmd [[highlight ScrollView guibg=Gray gui=none]]
vim.cmd [[highlight LspInlayHint guifg=#3a3a3a guibg=none]]

-- vim.cmd[[hi Pmenu guibg=Black guifg=White gui=NONE]]
