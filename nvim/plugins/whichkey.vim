" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

set timeoutlen=500

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
" let g:which_key_vertical=1

" Change the colors if you want
" highlight default link WhichKey          Operator
" highlight default link WhichKeySeperator DiffAdded
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler



" let g:which_key_map['e'] = [ ':CocCommand explorer', 'explorer'  ]
let g:which_key_map['e'] = [ ':NERDTreeToggle', 'explorer'  ]
let g:which_key_map['f'] = [ '<Plug>(easymotion-w)', 'jump'  ]

let g:which_key_map['q'] = {
                  \ 'name': '+close',
                  \ 'q': [':q', 'quit'],
                  \ 'w': [':wq!', 'write and quit'],
                  \ 'Q': [':q!', 'force quit'],
                  \ 's': [':SSave', 'save session'],
                  \ }

let g:which_key_map['w'] = {
                  \ 'name' : '+windows' ,
                  \ '=' : ['<C-W>='     , 'balance'],
                  \ 'h' : ['<C-W>h'     , 'left'],
                  \ 'j' : ['<C-W>j'     , 'below'],
                  \ 'l' : ['<C-W>l'     , 'right'],
                  \ 'k' : ['<C-W>k'     , 'up'],
                  \ '+' : [':vsplit'    , 'vertical split'],
                  \ '-' : [':split'     , 'split'],
                  \ 'w' : [':w'         , 'write file'],
                  \ 'H' : [':windo wincmd H', 'horizontal rotate'],
                  \ 'V' : [':windo wincmd K', 'vertical rotate'],
                  \ }

let g:which_key_map['b'] = {
                  \ 'name': '+buffer/tabs',
                  \ 't': [':tabnew', 'tab new'],
                  \ 'r': [':reg', 'registers'],
                  \ 'm': [':marks', 'marks'],
                  \ 'mt': [':SignatureToggleSigns', 'toggle marks'],
                  \ 'i': [':CocDiagnostics', 'info'],
                  \ }

let g:which_key_map['c'] = {
                  \ 'name': 'code',
                  \ 'a': [':CocAction', 'action'],
                  \ 'd': ['<Plug>(coc-definition)', 'definition'],
                  \ 't': ['<Plug>(coc-type-definition)', 'type definition'],
                  \ 'i': ['<Plug>(coc-implementation)', 'implementation'],
                  \ 'r': ['<Plug>(coc-references)', 'references'],
                  \ 'rn': ['<Plug>(coc-rename)', 'rename'],
                  \ 'w': [':ToggleWhitespace', 'whitespace toggle'],
                  \ 's': [':StripWhitespace', 'strip whitespace'],
                  \ 'f': ['<Plug>(coc-format-selected)', 'format'],
                  \ }



  let g:which_key_map['z'] = {
                    \ 'name' : '+special' ,
                    \ 'f' : [':FZF', 'fzf'],
                    \ }

if has("unix")

  let g:which_key_map['t'] = {
                    \ 'name' : '+terminal' ,
                    \ ';' : [':new term://zsh', 'new terminal'],
                    \ }
else
  let g:which_key_map['t'] = {
                    \ 'name' : '+terminal' ,
                    \ ';' : [':new term://cmd', 'new terminal'],
                    \ ',' : [':new term://cmd', 'new terminal'],
                    \ }
endif


call which_key#register('<Space>', "g:which_key_map")
