call plug#begin($XDG_DATA_HOME . '/nvim/plugins/')

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
Plug 'easymotion/vim-easymotion'
Plug 'puremourning/vimspector'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'

" Requires Nvim Nightly
if has('nvim-0.5.0')
  " Plug 'gennaro-tedesco/nvim-peekup'
  Plug 'tversteeg/registers.nvim'
endif

" Requires Unix
if has("unix")
  Plug 'sheerun/vim-polyglot'
endif

call plug#end()


