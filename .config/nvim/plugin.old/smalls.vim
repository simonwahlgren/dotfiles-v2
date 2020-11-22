" map normal-mode 's' for simple search
nmap ö <Plug>(smalls)
" if you want to use smalls in visual/operator or both mode.
omap ö <Plug>(smalls)
xmap ö <Plug>(smalls)

let g:smalls_auto_jump = 1
let g:smalls_auto_jump_min_input_length = 2
let g:smalls_auto_jump_timeout = 0.1

" let g:smalls_highlight = {
" \ 'SmallsJumpTarget':
" \     [['NONE', 'NONE', 'blue'], [ 'bold', 'NONE', 'red']],
" \ }
