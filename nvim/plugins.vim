call plug#begin($XDG_DATA_HOME . '/nvim/plugins/')

Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'farmergreg/vim-lastplace'
Plug 'szw/vim-maximizer'
Plug 'airblade/vim-rooter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'inside/vim-search-pulse'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'f-person/git-blame.nvim'
Plug 'vim-test/vim-test'
Plug 'chrisbra/Colorizer'
Plug 'preservim/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'danishprakash/vim-docker'
Plug 'mzlogin/vim-markdown-toc'
" Plug 'puremourning/vimspector'
" Plug 'sagi-z/vimspectorpy'
Plug 'masukomi/vim-markdown-folding'

" Color Scheme
if g:colorscheme == 'codedark'
  Plug 'tomasiser/vim-code-dark'
elseif g:colorscheme == 'lighthaus'
  Plug 'lighthaus-theme/vim-lighthaus'
endif


" Language Server
if g:native_lsp && has('nvim-0.5.0')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'kosayoda/nvim-lightbulb'
  Plug 'onsails/lspkind-nvim'
  Plug 'folke/trouble.nvim'
  Plug 'sbdchd/neoformat'
  Plug 'nvim-treesitter/nvim-treesitter'
else
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" Searching
if g:telescope_all && has('nvim-0.5.0')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
else
  Plug 'kien/ctrlp.vim'
  Plug 'junegunn/fzf'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
endif

" Status Line
if g:statusline == 'airline'
  Plug 'vim-airline/vim-airline'
elseif g:statusline == 'lightline'
  Plug 'itchyny/lightline.vim'
elseif g:statusline == 'galaxyline'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
elseif g:statusline == 'lualine'
  Plug 'hoob3rt/lualine.nvim'
endif

if g:bufferline
  Plug 'akinsho/nvim-bufferline.lua'
endif

if has('nvim')
  Plug 'kyazdani42/nvim-web-devicons'
else
  Plug 'ryanoasis/vim-devicons'
endif

if has('nvim-0.5.0')
  " Plug 'gennaro-tedesco/nvim-peekup'
  Plug 'tversteeg/registers.nvim'
endif

" Requires Unix
if has("unix")
  " Plug 'sheerun/vim-polyglot'
endif

"Old
" Plug 'voldikss/vim-floaterm'
" Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'
" Plug 'unblevable/quick-scope'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'tommcdo/vim-lion'

call plug#end()
