let g:vim_tags_use_language_field = 0
" vim-tags ignore functionality seems a bit shaky so lets disable it
" eg. having ctags or *.json inside .gitignore breaks vim-tags
let g:vim_tags_ignore_files = []

" Generate tags only on save, default is BufEnter and BufWritePost
" there is a bug when saving on BufEnter where the pwd will be changed to .git
let g:vim_tags_auto_generate = 0
autocmd BufWritePost * TagsGenerate

" current git directory, supports submodules
let g:gitdir = system('echo $(git rev-parse --git-dir)/tags')
execute "set tags=".g:gitdir
