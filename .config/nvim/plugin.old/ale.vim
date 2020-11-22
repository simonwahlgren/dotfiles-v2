let g:ale_linters = {
\   'python': ['flake8'],
\   'java': ['checkstyle'],
\   'javascript': ['eslint']
\}

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'java': ['google_java_format'],
\   'javascript': ['prettier_eslint']
\}

" Language specifics
" Java
let g:ale_java_checkstyle_options = '-c ~/.config/checkstyle/google_checks.xml'
let g:ale_java_google_java_format_options = '--aosp'

" Global
let g:ale_fix_on_save = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '>'
let g:ale_lint_delay = 500
let g:ale_statusline_format = ['%dE', '%dW', '']
let g:ale_list_window_size = 5
let g:ale_python_mypy_options = '-–ignore-missing-imports'
let g:ale_python_black_options = '--skip-string-normalization -l 100'

nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)
nnoremap <leader>n :ALEFix<cr>

" nnoremap gd :ALEGoToDefinition<cr>
" nnoremap gr :ALEFindReferences<cr>
" nnoremap K :ALEHover<cr>
