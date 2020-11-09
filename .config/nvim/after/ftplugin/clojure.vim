setlocal colorcolumn=81

" Strip off the symbols namespace
function! SanitizeTag(word)
    return (split(a:word, '/')[-1])
endfunction
nnoremap <buffer> <C-]> :exe ":tag ".SanitizeTag(expand("<cword>"))<cr>
