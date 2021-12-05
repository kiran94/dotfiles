--------------------------
-- KEYMAPPINGS
--------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", {noremap = true, silent = true})

vim.cmd [[

" file
nnoremap <leader>ww :w<CR>

" escape shortcuts
inoremap jk <esc>
inoremap kj <esc>
nnoremap <C-c> <Esc>

" navigate split screen panes
nnoremap <C-Left> <C-W>h
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
nnoremap <C-Right> <C-W>l

" navigate split screen panes 2
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -10<CR>
nnoremap <M-k>    :resize +10<CR>
nnoremap <M-l>    :vertical resize -10<CR>
nnoremap <M-h>    :vertical resize +10<CR>

" comment/uncomment the current line
noremap <C-c> gc<CR>

" working with tabs/buffers
" nnoremap <S-TAB> :tabp<CR>
" nnoremap <TAB> :tabn<CR>
nnoremap <S-TAB> :bprevious<CR>
nnoremap <TAB> :bnext<CR>

" better nav for omnicomplete
" inoremap <expr> <c-j> ("\<c-n>")
" inoremap <expr> <c-k> ("\<C-p>")

" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better indent
vnoremap < <gv
vnoremap > >gv

" remap visual block mode to alt+v
nnoremap <M-v> <C-v>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

nmap <Leader>tp :new term://zsh<CR>

" when in terminal node, esc to go from insert to normal mode
tnoremap <Esc> <C-\><C-N>

" clear search highlight
nnoremap <silent> // :noh<CR>

nnoremap ; :


" Telescope
nnoremap <M-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({hidden=true}))<cr>
nnoremap <M-o> <cmd>lua require('telescope.builtin').treesitter(require('telescope.themes').get_ivy({}))<cr>
nnoremap <M-/> <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>
nnoremap <M-g> <cmd>lua require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({}))<cr>
nnoremap <M-r> <cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_ivy({}))<cr>
nnoremap <M-b> <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({ignore_current_buffer=true, sort_lastused=true}))<cr>


" Snippets

" Expand
imap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <CR>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
]]
