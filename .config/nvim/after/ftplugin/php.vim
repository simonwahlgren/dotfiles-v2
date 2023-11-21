setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

augroup php
    autocmd!

    " disable indention for php
    autocmd FileType php filetype indent off

    " disable indention for php
    autocmd FileType ctrlsf setlocal cmdheight=1
augroup END
