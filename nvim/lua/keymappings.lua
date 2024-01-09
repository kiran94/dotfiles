--------------------------
-- KEYMAPPINGS
--------------------------
vim.g.mapleader      = " "
vim.g.maplocalleader = ","

-- escape shortcuts
vim.cmd [[inoremap jk <esc>]]
vim.cmd [[inoremap kj <esc>]]
vim.cmd [[inoremap <C-c> <Esc>]]

-- working with tabs/buffers
-- nnoremap <S-TAB> :tabp<CR>
-- nnoremap <TAB> :tabn<CR>
vim.cmd [[nnoremap <silent> <S-TAB> :bprevious<CR>]]
vim.cmd [[nnoremap <silent> <TAB> :bnext<CR>]]

-- Better indent
vim.cmd [[vnoremap <silent> < <gv]]
vim.cmd [[vnoremap <silent> > >gv]]

-- remap visual block mode to alt+v
vim.cmd [[nnoremap <M-v> <C-v>]]

-- clear search highlight
vim.cmd [[nnoremap <silent> // :noh<CR>]]
vim.cmd [[nnoremap ; :]]

-- move block selections
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", {noremap = true, silent = true})

--------------------------
-- WINDOW MANAGEMENT
--------------------------

--- navigate split screen panes
vim.cmd [[nnoremap <C-Left> <C-W>h]]
vim.cmd [[nnoremap <C-Down> <C-W>j]]
vim.cmd [[nnoremap <C-Up> <C-W>k]]
vim.cmd [[nnoremap <C-Right> <C-W>l]]

-- navigate split screen panes 2
vim.cmd [[nnoremap <C-J> <C-W><C-J>]]
vim.cmd [[nnoremap <C-K> <C-W><C-K>]]
vim.cmd [[nnoremap <C-L> <C-W><C-L>]]
vim.cmd [[nnoremap <C-H> <C-W><C-H>]]

-- Use alt + hjkl to resize windows
vim.cmd [[nnoremap <M-j>    :resize -10<CR>]]
vim.cmd [[nnoremap <M-k>    :resize +10<CR>]]
vim.cmd [[nnoremap <M-l>    :vertical resize -10<CR>]]
vim.cmd [[nnoremap <M-h>    :vertical resize +10<CR>]]

--------------------------
-- TERMINAL
--------------------------

-- when in terminal node, esc to go from insert to normal mode
vim.cmd [[tnoremap <Esc> <C-\><C-N>]]

--------------------------
-- TELESCOPE
--------------------------
local function telescope() return require('telescope.builtin') end
local function telescope_theme() return require('telescope.themes').get_ivy({hidden=true}) end

vim.keymap.set('n', '<M-p>', function() telescope().find_files(telescope_theme()) end)
vim.keymap.set('n', '<M-/>', function() telescope().live_grep(telescope_theme()) end)
vim.keymap.set('n', '<M-H>', function() telescope().help_tags(telescope_theme()) end)

--------------------------
-- SNIPPETS
--------------------------

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
vim.api.nvim_set_keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
