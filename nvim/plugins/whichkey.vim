" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

set timeoutlen=100

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

let g:which_key_map['e'] = [ ':CocCommand explorer', 'explorer'  ] 
" let g:which_key_map['\'] = [ ':Commentary', 'comment'  ] 

let g:which_key_map['q'] = {
                  \ 'name': '+close',
                  \ 'q': [':q', 'quit'],
                  \ 'w': [':wq!', 'write and quit'],
                  \ 'Q': [':q!', 'force quit'],
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
                  \ }

let g:which_key_map['t'] = {
                  \ 'name' : '+terminal' ,
                  \ ';' : [':FloatermNew --height=0.6 --width=0.8 --wintype=float --name=floaterm1 --position=bottomright --autoclose=2', 'terminal'],
                  \ 'f' : [':FloatermNew fzf', 'fzf'],
                  \ 'p' : [':FloatermNew --height=0.8 --width=0.8 bpython', 'bpython'],
                  \ 'pt' : [':FloatermNew --cwd=<root> --height=0.6 --width=0.8 --wintype=float --autoclose=0 python -m unittest', 'python test'],
                  \ 't' : [':FloatermNew --height=0.6 --width=0.8 --wintype=vsplit --name=floaterm2 --autoclose=2', 'toggle'],
                  \ }


let g:which_key_map['b'] = {
                  \ 'name': '+buffer/tabs',
                  \ 't': [':tabnew', 'tab new'],
                  \ }

let g:which_key_map['c'] = {
                  \ 'name': 'code',
                  \ 'a': [':CocAction', 'action'],
                  \ 'd': ['<Plug>(coc-definition)', 'definition'],
                  \ 't': ['<Plug>(coc-type-definition)', 'type definition'],
                  \ 'i': ['<Plug>(coc-implementation)', 'implementation'],
                  \ 'r': ['<Plug>(coc-references)', 'references'],
                  \ 'rn': ['<Plug>(coc-rename)', 'rename'],
                  \ }


call which_key#register('<Space>', "g:which_key_map")

