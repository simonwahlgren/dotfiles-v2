let python_version = system('python -c "from sys import version_info as v; print((v[0] * 100 + v[1]))"')

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

" disable auto continuing of comments
" setlocal fo-=c "Auto-wrap comments using textwidth, inserting the current comment leader automatically.
" setlocal fo-=r "Automatically insert the current comment leader after hitting <Enter> in Insert mode.
" setlocal fo-=o "Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.

" format json
" nnoremap <buffer> <silent><leader>J :%!python -m json.tool<cr>

if python_version >= 307
    nnoremap <buffer> <silent> <leader>BB Obreakpoint()<esc>
    nnoremap <buffer> <silent> <leader>bb obreakpoint()<esc>
    nnoremap <buffer> <silent> <leader>bf :/breakpoint()<cr>
    nnoremap <buffer> <silent> <leader>bd :g/breakpoint\(\)/d<cr>
else
    nnoremap <buffer> <silent> <leader>BB Oimport pdb; pdb.set_trace()<esc>
    nnoremap <buffer> <silent> <leader>bb oimport pdb; pdb.set_trace()<esc>
    nnoremap <buffer> <silent> <leader>bf :/pdb<cr>
    nnoremap <buffer> <silent> <leader>bd :g/pdb/d<cr>
endif

nnoremap <buffer> <silent> <leader>i :call system('isort -y '. expand('%:p'))<cr> <bar> :edit<cr>
