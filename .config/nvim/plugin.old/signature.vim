if &runtimepath =~ 'vim-signature'
  let g:SignatureMap = {'Leader': "<leader>m"}
  nnoremap <silent> [m :call signature#mark#Goto("prev", "line", "pos")<cr>
  nnoremap <silent> ]m :call signature#mark#Goto("next", "line", "pos")<cr>
endif
