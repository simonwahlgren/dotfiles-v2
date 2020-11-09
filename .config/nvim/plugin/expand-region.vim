vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" expand correctly in Python, requires vim-textobj-python
call expand_region#custom_text_objects('python', {
     \ 'af' :1,
     \ 'if' :1,
     \ 'aC' :1,
     \ 'iC' :1,
     \ 'i,w' :1,
     \ })
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ 'i,w' :1
      \ }
