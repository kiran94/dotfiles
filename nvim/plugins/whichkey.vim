" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

set timeoutlen=500

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0

" Change the colors if you want
" highlight default link WhichKey          Operator
" highlight default link WhichKeySeperator DiffAdded
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" let g:which_key_map['f'] = [ '<Plug>(easymotion-w)', 'jump'  ]

if g:telescope_all
  " let g:which_key_map['e'] = [ ':Telescope file_browser', 'explorer' ]

  nnoremap <leader>e <cmd>lua require('telescope.builtin').file_browser(require('telescope.themes').get_ivy({}))<cr>
  nnoremap <M-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({hidden=true}))<cr>
  " nnoremap <M-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>
  nnoremap <M-o> <cmd>lua require('telescope.builtin').treesitter(require('telescope.themes').get_ivy({}))<cr>
  nnoremap <M-/> <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<cr>
  nnoremap <M-g> <cmd>lua require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({}))<cr>
  nnoremap <M-b> <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({ignore_current_buffer=true, sort_lastused=true}))<cr>
  " nnoremap <S-p> <cmd>lua require('telescope.builtin').commands(require('telescope.themes').get_ivy({}))<cr>

else
  nnoremap <M-p> :CtrlPMixed<CR>
  let g:which_key_map['e'] = [ ':NERDTreeToggle', 'explorer'  ]
  " let g:which_key_map['e'] = [ ':CocCommand explorer', 'explorer'  ]
endif

" Quit
let g:which_key_map['q'] = {
                  \ 'name': '+close',
                  \ 'q':    [':bd', 'quit'],
                  \ 'a':    [':qa', 'quit all'],
                  \ 'w':    [':wq!', 'write and quit'],
                  \ 'Q':    [':q!', 'force quit'],
                  \ 's':    [':SSave', 'save session'],
                  \ }


" Window Management
let g:which_key_map['w'] = {
                  \ 'name': '+windows' ,
                  \ '=':    ['<C-W>='     , 'balance'],
                  \ 'h':    ['<C-W>h'     , 'left'],
                  \ 'j':    ['<C-W>j'     , 'below'],
                  \ 'l':    ['<C-W>l'     , 'right'],
                  \ 'k':    ['<C-W>k'     , 'up'],
                  \ '+':    [':vsplit'    , 'vertical split'],
                  \ '-':    [':split'     , 'split'],
                  \ 'w':    [':w'         , 'write file'],
                  \ 'H':    [':windo wincmd H', 'horizontal rotate'],
                  \ 'V':    [':windo wincmd K', 'vertical rotate'],
                  \ }

" Buffer Management
let g:which_key_map['b'] = {
                  \ 'name': '+buffer/tabs',
                  \ 't':    [':tabnew', 'tab new'],
                  \ 'r':    [':reg', 'registers'],
                  \ 'm':    [':marks', 'marks'],
                  \ 'mt':   [':SignatureToggleSigns', 'toggle marks'],
                  \ 'i':    [':CocDiagnostics', 'info'],
                  \ }

" Testing
let g:which_key_map['t'] = {
                  \ 'name': '+test',
                  \ 'n':    [':TestNearest', 'test nearest'],
                  \ 'f':    [':TestFile', 'test file'],
                  \ 'a':    [':TestSuite', 'test suite'],
                  \ }

" Special
let g:which_key_map['z'] = {
                  \ 'name': '+special' ,
                  \ '#':    [':ColorToggle', 'color toggle'],
                  \ 'pi':   [':PlugInstall', 'plug install'],
                  \ 'pc':   [':PlugClean', 'plug clean'],
                  \ }
"
" Language Server / Intellisense
if g:native_lsp
  let g:which_key_map['c'] = {
                    \ 'name': '+code',
                    \ 'w':       [':ToggleWhitespace', 'whitespace toggle'],
                    \ 's':       [':StripWhitespace', 'strip whitespace'],
                    \ 'c':       [':TagbarToggle', 'class definition'],
                    \ 'j':       [':TroubleToggle', 'code diagnostics'],
                    \ 'f':       [':Neoformat', 'format'],
                    \ 'b':       [':GitBlameToggle', 'git blame']
                    \ }

  nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
  nnoremap <silent> <leader>ci <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> <leader>cd <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <leader>cr <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> <leader>crn <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> ] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  nnoremap <silent> [ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
else
  let g:which_key_map['c'] = {
                    \ 'name': '+code',
                    \ 'a':    [':CocAction', 'action'],
                    \ 'd':    ['<Plug>(coc-definition)', 'definition'],
                    \ 't':    ['<Plug>(coc-type-definition)', 'type definition'],
                    \ 'i':    ['<Plug>(coc-implementation)', 'implementation'],
                    \ 'r':    ['<Plug>(coc-references)', 'references'],
                    \ 'rn':   ['<Plug>(coc-rename)', 'rename'],
                    \ 'w':    [':ToggleWhitespace', 'whitespace toggle'],
                    \ 's':    [':StripWhitespace', 'strip whitespace'],
                    \ 'f':    ['<Plug>(coc-format-selected)', 'format'],
                    \ 'c':    [':TagbarToggle', 'class definition'],
                    \ }
endif

let g:which_key_map['d'] = {
                  \ 'name': '+debug',
                  \ 'a':    [':call vimspector#Launch()', 'launch debugger'],
                  \ 'b':    [':call vimspector#ToggleBreakpoint()', 'toggle breakpoint'],
                  \ 'e':    [':call vimspector#ToggleConditionalBreakpoint()', 'toggle conditional breakpoint'],
                  \ 'C':    [':call vimspector#ClearBreakpoints()', 'clear breakpoint'],
                  \ 'w':    [':call AddToWatch()', 'add watch'],
                  \ 'r':    [':call vimspector#Restart()', 'restart'],
                  \ 'c':    [':call vimspector#Continue()', 'continue'],
                  \ 'so':   [':call vimspector#StepOut()', 'step out'],
                  \ 'si':   [':call vimspector#StepInto()', 'step in'],
                  \ 'sO':   [':call vimspector#StepOver()', 'step over'],
                  \ 'cc':   [':call vimspector#RunToCursor()', 'run to cursor'],
                  \ 'gc':   [':call GotoWindow(g:vimspector_session_windows.code)', 'go to code'],
                  \ 'gv':   [':call GotoWindow(g:vimspector_session_windows.variables)', 'go to variables'],
                  \ 'gw':   [':call GotoWindow(g:vimspector_session_windows.watches)', 'go to watches'],
                  \ 'gs':   [':call GotoWindow(g:vimspector_session_windows.stack_trace)', 'go to stack_trace'],
                  \ 'go':   [':call GotoWindow(g:vimspector_session_windows.output)', 'go to output'],
                  \ 'q':    [':call vimspector#Reset()', 'quit'],
                  \ }


call which_key#register('<Space>', "g:which_key_map")
