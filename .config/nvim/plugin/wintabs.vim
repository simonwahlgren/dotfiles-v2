map <silent> <C-n> <Plug>(wintabs_next)
map <silent> <C-p> <Plug>(wintabs_previous)
map <silent> <C-q> <Plug>(wintabs_close)
map <silent> <C-M-q> <Plug>(wintabs_close_vimtab)
map <silent> <C-M-o> <Plug>(wintabs_only)

let g:wintabs_ui_modified = '+'
let g:wintabs_ui_readonly = '-'
let g:wintabs_autoclose_vimtab = 1
let g:wintabs_ui_sep_inbetween = ' '
let g:wintabs_ui_sep_rightmost = ' '
let g:wintabs_ui_active_left = ' '
let g:wintabs_ui_active_right = ' '

set sessionoptions+=globals
