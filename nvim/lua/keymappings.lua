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
vim.cmd [[nnoremap <M-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({hidden=true}))<cr>]]
vim.cmd [[nnoremap <M-o> <cmd>lua require('telescope.builtin').treesitter(require('telescope.themes').get_ivy({}))<cr>]]
vim.cmd [[nnoremap <M-/> <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>]]
vim.cmd [[nnoremap <M-g> <cmd>lua require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({}))<cr>]]
vim.cmd [[nnoremap <M-r> <cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_ivy({}))<cr>]]
vim.cmd [[nnoremap <M-b> <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({ignore_current_buffer=true, sort_lastused=true}))<cr>]]
vim.cmd [[nnoremap <M-q> <cmd>lua require('telescope').extensions.neoclip.default()<cr>]]
vim.cmd [[nnoremap <M-H> <cmd>lua require('telescope.builtin').help_tags()<cr>]]

--------------------------
-- SNIPPETS
--------------------------

-- expand
vim.cmd [[imap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
vim.cmd [[smap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]

-- expand or jump
vim.cmd [[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
vim.cmd [[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

-- jump forward or backward
vim.cmd [[imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
vim.cmd [[smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]
vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]
-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
vim.cmd [[nmap s <Plug>(vsnip-select-text)]]
vim.cmd [[xmap s <Plug>(vsnip-select-text)]]
vim.cmd [[nmap S <Plug>(vsnip-cut-text)]]
vim.cmd [[xmap S <Plug>(vsnip-cut-text)]]
