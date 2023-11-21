nmap <C-S>f <Plug>CtrlSFPrompt
nmap <C-S>w <Plug>CtrlSFCwordExec
vmap <C-S>v <Plug>CtrlSFVwordExec
let g:ctrlsf_ackprg = '/usr/bin/rg'
let g:ctrlsf_mapping = {
\ "next": "n",
\ "prev": "N",
\ }
let g:ctrlsf_winsize = '100%'
" https://github.com/dyng/ctrlsf.vim/issues/329
let g:ctrlsf_search_mode = 'sync'
