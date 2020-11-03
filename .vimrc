" ------------------------ PLUGINS ------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-commentary'
Plug 'dstein64/vim-win'
Plug 'farmergreg/vim-lastplace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mg979/vim-visual-multi'
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'OmniSharp/omnisharp-vim'
Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'bagrat/vim-buffet'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'mileszs/ack.vim'
Plug 'tc50cal/vim-terminal'
Plug 'inside/vim-search-pulse'
Plug 'gko/vim-coloresque'

let g:airline#extensions#syntastic#enabled = 1
let g:airline_detect_spell = 0
call plug#end()

" ------------------------ General Settings ---------------------------

let mapleader = ","

set encoding=UTF-8
set ffs=unix,dos,mac
set updatetime=100
set number relativenumber
set autoread
set ruler
set signcolumn=number
set wildmode=longest,list,full
set wildmenu
set cmdheight=1
set hid
set showcmd

set spell
set spelllang=en_gb
set confirm
set backspace=indent,eol,start

" Split
set splitbelow
set splitright

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set showmatch

" Bell
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" File
syntax enable
filetype plugin on
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cursorline

" Backup
set nobackup
set nowb
set noswapfile

set termguicolors

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight
highlight clear SignColumn

color oceanic_material


" ------------------------ KEYWORD MAPPINGS ------------------------------------

" Navigating Panes
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

nnoremap <C-Left> <C-W>h
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
noremap <C-Right> <C-W>l

" Navigating Tabs
nmap <leader>t :tabnew<CR>
nmap <leader>q :q<CR>
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" Terminal
if v:version < 703
    nmap <C-j> :TerminalTab bash<CR>
    nmap <C-J> :TerminalVSplit bash<CR>
else
    nmap<C-j> :terminal<CR>
    imap<C-j> :q<CR>
    hi Terminal ctermbg=black ctermfg=white guibg=black guifg=white
endif

" Other Things
map <C-o> :NERDTreeToggle<CR>
map <C-c> :Commentary<CR>
nmap <C-I> gg=G<CR>
" nmap <C-w> :w<CR>

" Disabled Keys
nnoremap Q <nop>
nnoremap <TAB> <nop>

let g:buffet_powerline_separators = 1
let g:buffet_show_index = 1
let g:buffet_tab_icon = '🎉'
let g:buffet_new_buffer_name = '🔴'
" let g:buffet_modified_icon = '🟡'
let g:rainbow_active = 1

function! g:BuffetSetCustomColors()
    " cterm colors https://jonasjacek.github.io/colors/
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=27 ctermfg=15 guibg=#466adf guifg=#FFFFFF
    hi! BuffetTrunc cterm=bold ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=239 ctermfg=8 guibg=#504945 guifg=#000000
    hi! BuffetTab cterm=NONE ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=10 ctermfg=239 guibg=#999999 guifg=#504945
endfunction
