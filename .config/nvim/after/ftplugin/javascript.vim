setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

nnoremap <buffer> <silent> <leader>bB Odebugger;<esc>
nnoremap <buffer> <silent> <leader>bb odebugger;<esc>
nnoremap <buffer> <silent> <leader>bf :/debugger;<cr>
nnoremap <buffer> <silent> <leader>bd :g/debugger;/d<cr>
