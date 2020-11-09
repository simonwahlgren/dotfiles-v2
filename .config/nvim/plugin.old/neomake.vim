if &runtimepath =~ 'vim-neomake'
   " Run Neomake on enter and save
   autocmd! BufWritePost,BufEnter * Neomake

   " Disable verbose
   let g:neomake_verbose=0

   " Change default signs
   let g:neomake_warning_sign = {
     \ 'text': '>',
     \ 'texthl': 'NeomakeWarningSign',
     \ }
   let g:neomake_error_sign = {
     \ 'text': '>',
     \ 'texthl': 'NeomakeErrorSign',
     \ }

   highlight NeomakeErrorSign ctermfg=1 ctermbg=0
   highlight NeomakeWarningSign ctermfg=3 ctermbg=0
endif
