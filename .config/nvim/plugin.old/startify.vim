if &runtimepath =~ 'vim-startify'
  " When opening a file or bookmark, change to its directory.
  let g:startify_change_to_dir = 1

  let g:startify_session_autoload = 1
  let g:startify_session_persistence = 1
  let g:startify_session_delete_buffers = 1

  " Bookmarks
  let g:startify_bookmarks = [
            \ { 'f': '~/work/git/fyndiq/' },
            \ { 'n': '~/.config/nvim/' },
            \ ]
endif
