" https://gist.github.com/wellle/9289224
nnoremap <silent> ,a :set opfunc=Append<CR>g@
nnoremap <silent> ,i :set opfunc=Insert<CR>g@

function! Append(type, ...)
    normal! `]
    if a:type == 'char'
        call feedkeys("a", 'n')
    else
        call feedkeys("o", 'n')
    endif
endfunction
function! Insert(type, ...)
    normal! `[
    if a:type == 'char'
        call feedkeys("i", 'n')
    else
        call feedkeys("O", 'n')
    endif
endfunction
