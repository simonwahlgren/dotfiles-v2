let g:ale_linters = {
\   'python': ['flake8'],
\}

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\}

let g:ale_fix_on_save = 0
let g:ale_sign_column_always = 1
let g:ale_disable_lsp = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '>'
" let g:ale_lint_delay = 500
" let g:ale_statusline_format = ['%dE', '%dW', '']
" let g:ale_list_window_size = 5

nmap <silent> [d <Plug>(ale_previous_wrap)
nmap <silent> ]d <Plug>(ale_next_wrap)
nnoremap <leader>n :ALEFix<cr>
