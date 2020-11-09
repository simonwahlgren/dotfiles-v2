if &runtimepath =~ 'YouCompleteMe'
  " Preview options on completion
  " let g:ycm_add_preview_to_completeopt = 1

  " Close preview after completion
  " let g:ycm_autoclose_preview_window_after_completion = 1

  " Use first available 'python' binary
  let g:ycm_python_binary_path = 'python'

  " Complete builtin Python functions
  let g:ycm_seed_identifiers_with_syntax = 1

  " Complete in comments
  let g:ycm_complete_in_comments = 1

  " Collect from comments and strings
  let g:ycm_collect_identifiers_from_comments_and_strings = 1

  " Complete from strings
  let g:ycm_complete_in_strings = 1

  " Complete from tag files
  let g:ycm_collect_identifiers_from_tags_files = 1

  " Trigger semantic completion after import statement
  let g:ycm_semantic_triggers =  {
    \   'python' : ['import '],
    \ }

  nnoremap <leader>jg :YcmCompleter GoTo<CR>
  nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
  nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

  " Called once right before you start selecting multiple cursors
  function! Multiple_cursors_before()
    call youcompleteme#DisableCursorMovedAutocommands()
    let s:old_ycm_whitelist = g:ycm_filetype_whitelist
    let g:ycm_filetype_whitelist = {}
  endfunction

  " Called once only when the multiple selection is canceled (default <Esc>)
  function! Multiple_cursors_after()
    call youcompleteme#EnableCursorMovedAutocommands()
    let g:ycm_filetype_whitelist = s:old_ycm_whitelist
  endfunction
endif
