vim.g.vscode_style = "dark"
local colorscheme = "vscode"

-- Safely attempt to set the colorscheme
-- if not installed then just notify
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found")
end

vim.cmd([[highlight TelescopeMatching guifg=#8b0000]])
vim.cmd([[highlight Search guibg=Yellow guifg=Black gui=NONE]])
vim.cmd([[highlight Visual guifg=Black guibg=Orange gui=none]])
vim.cmd([[highlight LspSagaCodeActionContent guifg=White gui=none]])
vim.cmd([[highlight ScrollView guibg=Gray gui=none]])
vim.cmd([[highlight LspInlayHint guifg=#3a3a3a guibg=none]])

-- vim.cmd[[hi Pmenu guibg=Black guifg=White gui=NONE]]

-- cmp kind highlights
-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
vim.cmd([[
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword
]])
