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
map <C-c> gc<CR>

" working with tabs
nnoremap <S-TAB> :tabp<CR>
nnoremap <TAB> :tabn<CR>

" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")

" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better indent
vnoremap < <gv
vnoremap > >gv

