call plug#begin($XDG_DATA_HOME . '/nvim/plugins/')

" editor
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'unblevable/quick-scope'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kien/ctrlp.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'szw/vim-maximizer'
Plug 'tomasiser/vim-code-dark'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf'
Plug 'justinmk/vim-sneak'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
" Plug 'plasticboy/vim-markdown'
" Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'puremourning/vimspector'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'ryanoasis/vim-devicons'


Plug 'tpope/vim-commentary'
" Plug 'preservim/nerdcommenter'

if has("unix")
  Plug 'sheerun/vim-polyglot'
endif

call plug#end()


