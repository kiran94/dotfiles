
let g:startify_session_dir = '~/.config/nvim/.sessions'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']        },
      \ { 'type': 'files',     'header': ['   Files']             },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()]  },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \]

let g:startify_bookmarks = [
      \ { 'b': '~/.bashrc'  },
      \ { 'z': '~/.zshrc'  },
      \ { 'c': '~/.config'  },
      \ { 'i': '~/.config/nvim/init.vim'  },
      \ { 'p': '~/Documents/projects'  },
      \ { 'd': '~/Downloads'  },
      \]

" let g:startify_custom_header = [
"         \ '   _  __     _     ',
"         \ '  / |/ /  __(_)_ _ ',
"         \ ' /    / |/ / /  ` \',
"         \ '/_/|_/|___/_/_/_/_/',
"         \]

let g:startify_custom_header = [
      \ ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      \ ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      \ ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      \ ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      \ ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      \ ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      \ '                                                   ',
      \ ''
      \ ]
