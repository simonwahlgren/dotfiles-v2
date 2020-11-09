let python_version = system('python -c "from sys import version_info as v; print((v[0] * 100 + v[1]))"')

if python_version >= 307
    let jedi#force_py_version=3
else
    let jedi#force_py_version=2
endif

" Show call signature in popup window
let g:jedi#show_call_signatures = 0
" YCM bug - https://github.com/Valloric/YouCompleteMe/issues/1890
let g:jedi#show_call_signatures_delay = 0

let g:jedi#popup_on_dot = 0
let g:jedi#completions_enabled = 0
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#use_tabs_not_buffers = 1

" Disable auto insert of 'import'
let g:jedi#smart_auto_mappings = 0

" let g:jedi#goto_command = ""
" let g:jedi#goto_assignments_command = ""
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = ""
" let g:jedi#usages_command = ""
" let g:jedi#completions_command = ""
" let g:jedi#rename_command = ""

let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "ga"
let g:jedi#goto_definitions_command = "gD"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "gr"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "gR"

let g:jedi#popup_select_first = 1

" Disable docstring popup in the top
autocmd FileType python setlocal completeopt-=preview
