setlocal formatoptions-=q " disable formatting of comments
setlocal textwidth=120
setlocal smartindent
setlocal spell spelllang=en_us
setlocal expandtab
setlocal conceallevel=0
setlocal tabstop=2
setlocal shiftwidth=2

map <buffer> j gj
map <buffer> k gk

" reflow bullet lists
nmap <buffer> ,Q :g/- /norm $gq$<cr>''
vmap <buffer> ,Q :g/- /norm $gq$<cr>

function! EmbedScreenshot()
  :r!screenshot_to_current_dir.sh -d %:p:h
  " split path and replace with an embedded image reference (markdown)
  :s/^\(.*\/\)\([^\/]*\).png$/![\2](\0)
endfunction
nnoremap <buffer> <leader><F12> :call EmbedScreenshot()<cr>

" preview markdown files using grip and asyncrun
function! s:MarkdownPreview()
  :AsyncRun! grip %:p
  sleep 1000m
  :!xdg-open http://localhost:6419/
endfunction

nnoremap <buffer> ,mp :!pkill grip<cr>:call <SID>MarkdownPreview()<cr>
nnoremap <buffer> ,ms :!pkill grip<cr>
