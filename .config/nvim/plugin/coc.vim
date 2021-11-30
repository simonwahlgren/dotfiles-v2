" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-n> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-n> coc#refresh()
" else
"   inoremap <silent><expr> <c-n> coc#refresh()
" endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use `[a` and `]a` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [d <Plug>(coc-diagnostic-prev)
" nmap <silent> ]d <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Format file
" nmap <leader>n :Format<cr>
" " Formatting selected code.
" xmap <leader>n  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"   " Sort imports on save
"   " autocmd BufWritePre *.py :Sort
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>ccp` for current paragraph
" xmap <leader>ca  <Plug>(coc-codeaction-selected)
" nmap <leader>ca  <Plug>(coc-codeaction-selected)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 Sort :CocCommand python.sortImports

" let g:coc_fzf_preview = "right:60%"

" " Show all diagnostics.
" nnoremap <silent><nowait> <space>cd  :<C-u>CocFzfList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>ce  :<C-u>CocFzfList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>cc  :<C-u>CocFzfList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>co  :<C-u>CocFzfList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>cs  :<C-u>CocFzfList symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

" " Symbol renaming. Rope required
" nmap <leader>cr <Plug>(coc-rename)
