let g:native_lsp    = 1
let g:telescope_all = 1
let g:statusline    = 'lualine'
let g:colorscheme   = 'codedark'
let g:bufferline    = 1
let g:dap           = 1

source $XDG_CONFIG_HOME/nvim/plugins.vim
source $XDG_CONFIG_HOME/nvim/general.vim
source $XDG_CONFIG_HOME/nvim/keymappings.vim
source $XDG_CONFIG_HOME/nvim/gui.vim

" Basic Plugin Configuration
source $XDG_CONFIG_HOME/nvim/plugins/start.vim
source $XDG_CONFIG_HOME/nvim/plugins/autopairs.vim
source $XDG_CONFIG_HOME/nvim/plugins/todo_highlight.vim
source $XDG_CONFIG_HOME/nvim/plugins/gitgutter.vim
source $XDG_CONFIG_HOME/nvim/plugins/trailing_whitespace.vim

source $XDG_CONFIG_HOME/nvim/plugins/maximizer.vim
source $XDG_CONFIG_HOME/nvim/plugins/tagbar.vim
source $XDG_CONFIG_HOME/nvim/plugins/easyalign.vim
source $XDG_CONFIG_HOME/nvim/plugins/markdown_toc.vim
source $XDG_CONFIG_HOME/nvim/plugins/git_blame.vim
" source $XDG_CONFIG_HOME/nvim/plugins/easymotion.vim
" source $XDG_CONFIG_HOME/nvim/plugins/vimspector.vim
" source $XDG_CONFIG_HOME/nvim/plugins/floaterm.vim
" source $XDG_CONFIG_HOME/nvim/plugins/quickscope.vim
" source $XDG_CONFIG_HOME/nvim/plugins/sneak.vim
source $XDG_CONFIG_HOME/nvim/plugins/neoformatter.vim
source $XDG_CONFIG_HOME/nvim/plugins/nvim-tree.vim

" Searching
if g:telescope_all
  luafile $XDG_CONFIG_HOME/nvim/plugins/telescope.lua
else
  source $XDG_CONFIG_HOME/nvim/plugins/ctrlp.vim
  source $XDG_CONFIG_HOME/nvim/plugins/nerdtree.vim
  source $XDG_CONFIG_HOME/nvim/plugins/fzf.vim
endif

" Language Server
if g:native_lsp
  luafile $XDG_CONFIG_HOME/nvim/plugins/lsp.lua
  luafile $XDG_CONFIG_HOME/nvim/plugins/lsp-compe.lua
  " luafile $XDG_CONFIG_HOME/nvim/plugins/lsp-lightbulb.lua
  luafile $XDG_CONFIG_HOME/nvim/plugins/lsp-kind.lua
  luafile $XDG_CONFIG_HOME/nvim/plugins/lsp-trouble.lua
  luafile $XDG_CONFIG_HOME/nvim/plugins/treesitter.lua
else
  source $XDG_CONFIG_HOME/nvim/plugins/coc.vim
endif

" Status Line
if g:statusline == 'airline'
  source $XDG_CONFIG_HOME/nvim/plugins/airline.vim
elseif g:statusline == 'lightline'
  source $XDG_CONFIG_HOME/nvim/plugins/lightline.vim
elseif g:statusline == 'galaxyline'
  luafile $XDG_CONFIG_HOME/nvim/plugins/galaxyline.lua
elseif g:statusline == 'lualine'
  luafile $XDG_CONFIG_HOME/nvim/plugins/lualine-statusline.lua
endif

if g:bufferline
  luafile $XDG_CONFIG_HOME/nvim/plugins/bufferline.lua
endif

" Color Scheme
if g:colorscheme == 'codedark'
  source $XDG_CONFIG_HOME/nvim/plugins/colorscheme/codedark.vim
elseif g:colorscheme == 'lighthaus'
  source $XDG_CONFIG_HOME/nvim/plugins/colorscheme/lighthaus.vim
endif

source $XDG_CONFIG_HOME/nvim/plugins/whichkey.vim
source $XDG_CONFIG_HOME/nvim/colors.vim
