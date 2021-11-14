" SETTINGS
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
set report=0                   " always report the number of lines yanked
highlight clear SignColumn     " don't add a background color to the sign column
set shortmess=a                " stop enter prompts
set cmdheight=2

" Fold Settings
set foldcolumn=auto
set foldnestmax=1
set foldmethod=indent
" set foldmethod=expr
" set foldexpr=GetFoldLevel(v:lnum)
set foldignore=#
set nofoldenable
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave ?* silent! mkview
"   autocmd BufWinEnter ?* silent! loadview
" augroup END

" filetype plugin indent on
autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

" the length of time vim waits after you stop typing to activate plugins
" note in vim versions < pre-7.4.427 this can lead to visual glitches
" note required to be low for coc
set updatetime=300

" stop auto-indent in pasting from external
" this breaks compe completion
" set paste

" allow wrapping for markdown files
autocmd FileType markdown set wrap

" stop auto comment when pasting
" set formatoptions-=cro

" set python path
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" tab completion on command
" also used in ctrl p
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,\.git,*/bin/*,*/obj/*,*egg-info*,htmlcov/*,*/node_modules/* " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,\.git,*/bin/*,*/obj/*,*egg-info*,htmlcov/*,*/node_modules/*  " Windows
