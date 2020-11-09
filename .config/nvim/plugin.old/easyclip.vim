let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipShareYanks = 1
let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipUseSubstituteDefaults = 1

" easyclip shadows the builtin m command
nnoremap gm m

nmap mm m_-
nmap M m$

imap <c-v> <plug>EasyClipInsertModePaste
