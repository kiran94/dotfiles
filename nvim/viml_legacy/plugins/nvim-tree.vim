let g:nvim_tree_gitignore = 1                                 " 0 by default
let g:nvim_tree_quit_on_open = 1                              " 0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1                            " 0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1                                    " 0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1                    " 0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~'                   " This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1                              " 0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1                               " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1                     " 0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' '                            " one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them
" set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = true,  -- disables netrw completely
  hijack_netrw        = true,  -- hijack netrw window on startup
  open_on_setup       = false, -- open the tree when running this setup function
  ignore_ft_on_setup  = {},    -- will not open on setup if the filetype is in this list
  auto_close          = true,  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  open_on_tab         = true,  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened

  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    enable    = true, -- enable the feature
    auto_open = false, -- allow to open the tree if it was previously closed
  },

  hijack_cursor = true, -- hijack the cursor in the tree to put it at the start of the filename
  update_cwd    = true, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)

  -- LSP diagnostics
  diagnostics   = {
      enable    = true
  },

  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = { '.git', 'node_modules', 'cache', '.mypy_cache'  }
  },

  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    cmd  = nil, -- the command to run this, leaving nil should work in most cases
    args = {} -- the command arguments as a list
  },

  filters = {
      -- hide dotfiles
      dotfiles = false
  },

  view = {
    width       = 40, -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    -- height      = 30, -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    side        = 'right', -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    auto_resize = false, -- if true the tree will resize itself after opening a file
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}
EOF

