" disable spelling status
let g:airline_detect_spell = 0

if !g:bufferline
  " enable top tab bar
  let g:airline#extensions#tabline#enabled = 1
endif

" enable powerline fonts
let g:airline_powerline_fonts = 1

" native lsp
let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = 'E:'
let airline#extensions#nvimlsp#warning_symbol = 'W:'

