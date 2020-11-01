" GENERAL

set encoding=utf8
set ffs=unix,dos,mac
set updatetime=100
set number
set ruler
set signcolumn=number
set wildmode=longest,list,full
set wildmenu
set cmdheight=1
set hid
set smarttab

let mapleader = ","

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

" Backup
set nobackup
set nowb
set noswapfile

" Highlight
highlight clear SignColumn

" PLUGINS

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

Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'

Plug 'OmniSharp/omnisharp-vim'

let g:airline#extensions#syntastic#enabled = 1

call plug#end()
