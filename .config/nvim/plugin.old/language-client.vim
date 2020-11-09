let g:LanguageClient_serverCommands = {
\   'java': ['/usr/bin/jdtls']
\ }

let g:LanguageClient_diagnosticsDisplay = {
\    1: {
\        "name": "Error",
\        "texthl": "ALEError",
\        "signText": ">",
\        "signTexthl": "ALEErrorSign",
\    },
\    2: {
\        "name": "Warning",
\        "texthl": "ALEWarning",
\        "signText": ">",
\        "signTexthl": "ALEWarningSign",
\    },
\    3: {
\        "name": "Information",
\        "texthl": "ALEInfo",
\        "signText": ">",
\        "signTexthl": "ALEInfoSign",
\    },
\    4: {
\        "name": "Hint",
\        "texthl": "ALEInfo",
\        "signText": ">",
\        "signTexthl": "ALEInfoSign",
\    },
\ }

nnoremap K :call LanguageClient_textDocument_hover()<cr>
nnoremap gd :call LanguageClient_textDocument_definition()<cr>
nnoremap gR :call LanguageClient_textDocument_rename()<cr>
nnoremap gr :call LanguageClient_textDocument_references()<cr>
" nnoremap <leader>lF :call LanguageClient_textDocument_formatting()<cr>
" vnoremap <leader>lf :call LanguageClient_textDocument_rangeFormatting()<cr>

let g:LanguageClient_trace = 'verbose'
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
