if &runtimepath =~ 'neoterm'
  let g:neoterm_position = 'vertical'
  let g:neoterm_automap_keys = '<leader>tt'
  let g:neoterm_repl_python = 'ipython_wrapper --foobar'

  vnoremap <silent> <c-c><c-c> :TREPLSendSelection<cr>
  vnoremap <silent> <c-c><c-f> :TREPLSendFile<cr>

  " hide/close terminal
  " nnoremap <silent> <leader>th :call neoterm#close()<cr>
  " clear terminal
  " nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  " nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
endif
