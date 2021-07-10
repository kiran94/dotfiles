set encoding=utf-8
set nospell                    " no spelling, use lsp for this
set spelllang=en_gb            " spelling language
set nocompatible               " dont try and be compatible with vi
set number relativenumber      " add line numbers and enable relative
set splitbelow                 " split down with :split
set splitright                 " split right with :vsplit
set confirm                    " confirm option when saving without changes
set backspace=indent,eol,start " make backspace work as expected
set ffs=unix,dos,mac           " file line endings when trying to open, close files
set smartcase                  " search with no casing when casing in the search string is detected
set hlsearch                   " highlight search
set incsearch                  " highlight as typing search term
set showmatch                  " when brace is inserted, briefly jump to matching
set tm=500                     " set timeout for keyboard sequences
set autoread                   " when the file has been changed outside of vim, read the file in
set ruler                      " line number and column position shown in the bottom bar
set hidden                     " when a hidden buffer is abandoned, drop it
set history                    " history when searching through commands
set signcolumn=yes             " show the sign column on the left, for git changes for example
set lazyredraw                 " when executing macros, don't redraw the screen
set mouse=nv                   " enable mouse
set tabstop=4                  " one tab = 4 spaces
set shiftwidth=4               " shift tab = 4
set expandtab                  " when a tab is inserted, use spaces
set smarttab                   " when a tab is inserted, use spaces?
set nobackup                   " no backup files
set nowritebackup              " no write backup
set noswapfile                 " no swap files
set termguicolors              " set 24-bit colors
set clipboard=unnamedplus      " allow pasting from external programs
set nowrap                     " don't word wrap
set scrolloff=8                " scroll before you hit the bottom of the screen
set path+=**                   " path used when running certain commands like gf
set shortmess=a
