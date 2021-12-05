" https://thoughtbot.com/blog/align-github-flavored-markdown-tables-in-vim
" when in markdown file, expose shortcut to clean up markdown table
" in visual mode selection
autocmd FileType markdown vmap <leader>t :EasyAlign*<Bar><CR>
