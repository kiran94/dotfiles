" https://github.com/mzlogin/vim-markdown-toc#features

" used for auto update
let g:vmt_fence_text = 'toc'
let g:vmt_fence_closing_text = '/toc'

" autocmd FileType markdown vmap <leader>t :EasyAlign*<Bar><CR>
autocmd FileType markdown nmap <leader>c :GenTocGFM<CR>
