" KEYMAPPINGS
let mapleader = " " 

" file
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" escape shortcuts
imap jj <esc>
imap ii <esc>

" create splits
nnoremap <leader>= :vsplit<CR>
nnoremap <leader>- :split<CR>

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

" comment/Uncomment the current line
map <C-c> :Commentary<CR>

" working with tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <S><TAB> :tabp<CR>
nnoremap <TAB> :tabn<CR>
