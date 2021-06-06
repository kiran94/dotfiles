" LSP config (the mappings used in the default file don't quite work right)

nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ci <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>cd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>cr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> <leader>ci <cmd>lua vim.lsp.buf.implementation()<CR>

nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" Enter will select the current entry when in completion
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>"
                \ :ncm2_ultisnips#expand_or("\<C-y>",'n')):"\<Tab>")

