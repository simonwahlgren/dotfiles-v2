function! FindProjectName()
  let s:name = getcwd()
  if s:name != ""
    let s:name = substitute(s:name, "/", "", "g")
  end
  return s:name
endfunction

" Sessions only restored if we start Vim without args.
function! RestoreSession(name)
  if a:name != ""
    if filereadable($HOME . "/.vim/sessions/" . a:name . ".vim")
      execute 'source ' . $HOME . "/.vim/sessions/" . a:name . ".vim"
    end
  end
endfunction

" Sessions only saved if we start Vim without args.
function! SaveSession(name)
  if a:name != ""
    execute 'mksession! ' . $HOME . '/.vim/sessions/' . a:name . '.vim'
  end
endfunction

" Restore and save sessions.
if argc() == 0
  autocmd VimEnter * nested call RestoreSession(FindProjectName())
  autocmd VimLeave * call SaveSession(FindProjectName())
end

set sessionoptions-=options  " Don't save options
