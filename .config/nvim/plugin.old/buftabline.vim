if &runtimepath =~ 'vim-buftabline'
   let g:buftabline_numbers = 2
   let g:buftabline_indicators = 1

   nmap <silent> <M-1> <Plug>BufTabLine.Go(1)
   nmap <silent> <M-2> <Plug>BufTabLine.Go(2)
   nmap <silent> <M-3> <Plug>BufTabLine.Go(3)
   nmap <silent> <M-4> <Plug>BufTabLine.Go(4)
   nmap <silent> <M-5> <Plug>BufTabLine.Go(5)
   nmap <silent> <M-6> <Plug>BufTabLine.Go(6)
   nmap <silent> <M-7> <Plug>BufTabLine.Go(7)
   nmap <silent> <M-8> <Plug>BufTabLine.Go(8)
   nmap <silent> <M-9> <Plug>BufTabLine.Go(9)

   hi BufTabLineCurrent ctermbg=234 ctermfg=12 cterm=NONE
   hi BufTabLineActive ctermbg=232 ctermfg=12 cterm=NONE
   hi BufTabLineHidden ctermbg=232 ctermfg=12 cterm=NONE
   hi BufTabLineFill ctermbg=232 ctermfg=12 cterm=NONE
   " augroup buftabline_hi
   "   au!
   "   autocmd ColorScheme *
   "      \ hi BufTabLineCurrent ctermbg=234 ctermfg=12 cterm=NONE
   "      \ hi BufTabLineActive ctermbg=232 ctermfg=12 cterm=NONE
   "      \ hi BufTabLineHidden ctermbg=232 ctermfg=12 cterm=NONE
   "      \ hi BufTabLineFill ctermbg=232 ctermfg=12 cterm=NONE
   " augroup END
endif
