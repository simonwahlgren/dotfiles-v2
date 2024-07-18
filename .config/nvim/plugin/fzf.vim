nnoremap <C-f> :Files<CR>
nnoremap <leader>ff :Rg!<space>
nnoremap <silent> <leader>fd :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <leader>fw :Rg! <C-R><C-W><CR>
nnoremap <silent> <leader>fe :BTags<CR>
nnoremap <silent> <leader>ft :Tags<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fm :FZFMru<CR>
nnoremap <silent> <leader>fc :BCommits!<CR>
nnoremap <silent> <leader>fC :Commits!<CR>

" Build a quickfix list when multiple files are selected
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-x': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

let gitdir = system('echo $(git rev-parse --git-dir)/tags')
" For some reason the first time the tag file is generated we
" get 'Failed to create tags', but the file is correctly created
let g:fzf_tags_command = 'ptags -f ' . gitdir

let g:fzf_layout = { 'down': '~100%' }
" Floating window mode
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'FZFNormal'],
 \ 'bg':      ['bg', 'FZFNormal'],
 \ 'hl':      ['fg', 'FZFComment'],
 \ 'fg+':     ['fg', 'FZFCursorLine', 'FZFCursorColumn', 'FZFNormal'],
 \ 'bg+':     ['bg', 'FZFCursorLine', 'FZFCursorColumn'],
 \ 'hl+':     ['fg', 'FZFStatement'],
 \ 'info':    ['fg', 'FZFPreProc'],
 \ 'prompt':  ['fg', 'FZFConditional'],
 \ 'pointer': ['fg', 'FZFException'],
 \ 'marker':  ['fg', 'FZFKeyword'],
 \ 'spinner': ['fg', 'FZFLabel'],
 \ 'header':  ['fg', 'FZFComment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" use bat as preview program when browsing files
let g:fzf_files_options =
\'--preview "bat --color always {} | head -'.&lines.'"'

let g:fzf_preview_window = 'right:60%'

command! FZFMru call fzf#run({
  \  'source':  v:oldfiles,
  \  'sink':    'e',
  \  'options': '-m -x +s',
  \  'down':    '20%'})

" Augment :Rg and :Files with preview.
" :Rg  - start without preview, press ? to toggle preview
" :Rg! - start with preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -F --column --line-number --hidden --glob "!.git" --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('right:60%')
  \           : fzf#vim#with_preview('right:60%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:60%'), <bang>0)
