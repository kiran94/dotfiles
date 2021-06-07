let g:native_lsp=1

source $XDG_CONFIG_HOME/nvim/plugins.vim
source $XDG_CONFIG_HOME/nvim/general.vim
source $XDG_CONFIG_HOME/nvim/keymappings.vim
source $XDG_CONFIG_HOME/nvim/gui.vim

source $XDG_CONFIG_HOME/nvim/plugins/colorscheme/codedark.vim
" source $XDG_CONFIG_HOME/nvim/plugins/colorscheme/lighthaus.vim

source $XDG_CONFIG_HOME/nvim/plugins/airline.vim
source $XDG_CONFIG_HOME/nvim/plugins/lightline.vim

source $XDG_CONFIG_HOME/nvim/plugins/gitgutter.vim
source $XDG_CONFIG_HOME/nvim/plugins/nerdtree.vim
source $XDG_CONFIG_HOME/nvim/plugins/maximizer.vim
source $XDG_CONFIG_HOME/nvim/plugins/start.vim
source $XDG_CONFIG_HOME/nvim/plugins/fzf.vim
source $XDG_CONFIG_HOME/nvim/plugins/floaterm.vim
source $XDG_CONFIG_HOME/nvim/plugins/quickscope.vim
source $XDG_CONFIG_HOME/nvim/plugins/sneak.vim
source $XDG_CONFIG_HOME/nvim/plugins/vimspector.vim
source $XDG_CONFIG_HOME/nvim/plugins/trailing_whitespace.vim
source $XDG_CONFIG_HOME/nvim/plugins/easymotion.vim
source $XDG_CONFIG_HOME/nvim/plugins/autopairs.vim
source $XDG_CONFIG_HOME/nvim/plugins/ctrlp.vim
source $XDG_CONFIG_HOME/nvim/plugins/todo_highlight.vim
source $XDG_CONFIG_HOME/nvim/plugins/tagbar.vim
source $XDG_CONFIG_HOME/nvim/plugins/easyalign.vim
source $XDG_CONFIG_HOME/nvim/plugins/markdown_toc.vim
source $XDG_CONFIG_HOME/nvim/colors.vim

if g:native_lsp
  source $XDG_CONFIG_HOME/nvim/plugins/lsp.vim
  luafile $XDG_CONFIG_HOME/nvim/plugins/lsp.lua
  luafile $XDG_CONFIG_HOME/nvim/plugins/lsp-compe.lua
  luafile $XDG_CONFIG_HOME/nvim/plugins/lsp-lightbulb.lua
else
  source $XDG_CONFIG_HOME/nvim/plugins/coc.vim
endif

source $XDG_CONFIG_HOME/nvim/plugins/whichkey.vim


