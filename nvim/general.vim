
" SETTINGS
set encoding=UTF-8
set nospell
set spelllang=en_gb

" add line numbers and enable relative
set number relativenumber
" split down with :split
set splitbelow
"split right with :vsplit
set splitright
" confirm option when saving without changes
set confirm
" make backspace work as expected
set backspace=indent,eol,start
" tab completion on command
set wildmenu
" the length of time vim waits after you stop typing to activate plugins
" note in vim versions < pre-7.4.427 this can lead to visual glitches
set updatetime=100
" file line endings when trying to open, close files
set ffs=unix,dos,mac
" search with no casing when casing in the search string is detected
set smartcase
" highlight search
set hlsearch
" highlight as typing search term
set incsearch
" when brace is inserted, briefly jump to matching
set showmatch
" set timeout for keyboard sequences
set tm=500
" when the file has been changed outside of vim, read the file in
set autoread
" line number and column position shown in the bottom bar
set ruler
" when a hidden buffer is abondoned, drop it
set hidden
" history when searching through commands
set history
" show the sign column on the left, for git changes for example
set signcolumn=yes
" don't add a background color to the sign column
highlight clear SignColumn
" when executing macros, don't redraw the screen
set lazyredraw
" enable mouse
set mouse=nv
" one tab = 4 spaces
set tabstop=4
" when a tab is inserted, use spaces
set expandtab
" when a tab is inserted, use spaces?
set smarttab
" no backup files
set nobackup
" no swap files
set noswapfile
" set 24-bit colors
set termguicolors
" allow pasting from external programs
set clipboard=unnamedplus
" stop auto-indent in pasting from external
set paste
" always report the number of lines yanked
set report=0
" visual studio code dark color
colorscheme codedark
" don't word wrap
set nowrap
" allow wrapping for markdown files
autocmd FileType markdown set wrap
" stop auto comment when pasting
" set formatoptions-=cro
" scroll before you hit the bottom of the screen
set scrolloff=8


if has('gui_running')
  set GuiFont=Delugia Mono Nerd Font
endif
