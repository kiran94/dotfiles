" KEYMAPPINGS
" See which key mappings for more
let g:mapleader = " "
let g:maplocalleader = ','

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
noremap <C-c> :Commentary<CR>

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
nnoremap // :noh<CR>

nnoremap ; :

" Toggle Undo Tree
nnoremap U :UndotreeToggle<CR>


lua	<< EOF
-- move up and down a visually selected block
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})
EOF
