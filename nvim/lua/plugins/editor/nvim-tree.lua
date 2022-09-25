local options = {}

options.config = function()

    require'nvim-tree'.setup {
      disable_netrw      = true,  -- disables netrw completely
      hijack_netrw       = true,  -- hijack netrw window on startup
      open_on_setup      = false, -- open the tree when running this setup function
      open_on_tab        = true,  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
      hijack_cursor      = true,  -- hijack the cursor in the tree to put it at the start of the filename
      update_cwd         = true,  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
      ignore_ft_on_setup = {},    -- will not open on setup if the filetype is in this list
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
        },
      },
      -- hijacks new directory buffers when they are opened.
      hijack_directories   = {
        enable    = true,  -- enable the feature
        auto_open = false, -- allow to open the tree if it was previously closed
      },
      -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
      update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = { '.git', 'node_modules', 'cache', '.mypy_cache'  }
      },
      filters = {
        dotfiles = false -- hide dotfiles
      },
      view = {
        width       = 40,        -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
        side        = 'right',   -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        mappings = {
          -- custom only false will merge the list with the default mappings
          -- if true, it will only use your list to set the mappings
          custom_only = false,
          -- list of mappings to set on the tree manually
          list = {}
        }
      },
      actions = {
            open_file = {
                resize_window = true
            }
        },
    }

    -- Automatically close nvim when nvim-tree is the last window
    vim.cmd[[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]
end


return options
