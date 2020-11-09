function! StripWhitespace ()
    exec ':%s/ \+$//ge'
endfunction

autocmd BufWritePre *.py,*.clj,*.yaml,*.json call StripWhitespace()
