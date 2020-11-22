let g:neoformat_enabled_python = ['yapf']
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_only_msg_on_error = 1

nnoremap <leader>N :Neoformat<cr>
vnoremap <leader>N :Neoformat<cr>
