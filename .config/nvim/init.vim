"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bootstrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent !mkdir -p ~/.vim/sessions/ > /dev/null 2>&1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Variables
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" netrw, borrowed from @mcantor
let g:netrw_banner=0 "disable annoying banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 "open splits to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" put yanked stuff in system register
set clipboard=unnamedplus

" don't wrap lines
set nowrap

" turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" undofile
set undofile
set undodir=$HOME/.vim_undo

" make is possible to switch buffers without saving modifications
set hidden

" reduce and shorten command line messages
set report=9999
set shortmess=astTWAIcF

" prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" don't redraw on non typed commands
set lazyredraw

" substitute all matches in the line
set gdefault

" set popup menu height to 10 items
set pumheight=10

" disbale folding
set nofoldenable

" the first tab hit will complete as much as possible,
" the second tab hit will provide a list,
" the third and subsequent tabs will cycle through completion options
"     so you can complete the file without further keys
set wildmode=longest,list,full

" enable mouse in all modes
set mouse=a

" spelling language
set spell spelllang=en_us

" preview substitutions as you type
set inccommand=nosplit

" position splitted windows below
set splitbelow

" able to move past ends in visual mode
set virtualedit=block

" use ripgrep as grepper
if executable('rg')
    set grepprg=rg\ -S\ --vimgrep
endif

" better diffs using histogram algorithm (like vim-diff-enhanced)
if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always have at least 10 lines above/beneath cursor
set scrolloff=10

" search as characters are entered
set incsearch

" don't highlight matches
set nohlsearch

" case insensitive searches
" set ignorecase smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" convert tabs to four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" indent when moving to the next line while writing code
set autoindent

" indent wrapped lines
set breakindent

" indenting them another level and showing 'showbreak' char
set breakindentopt=shift:4,sbr
set showbreak=↪

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface and visual
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax on

" show a visual line under the cursor's current line
set nocursorline

" show current line/column
set ruler

" don't conceal anything
set conceallevel=0

" enable Vim's hybrid mode
set relativenumber
set number

" don't syntax highlight more then 256 chars
set synmaxcol=256
syntax sync minlines=256

" highlight characters
set list!
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" color scheme
set background=dark
colorscheme darch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=
set statusline +=%1*\ \%{toupper(mode())}\ \%*
set statusline +=%2*%f

" right aligned
set statusline +=%=

"display a warning if fileformat isnt unix
set statusline +=%#warningmsg#
set statusline +=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline +=%#warningmsg#
set statusline +=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline +=%*

set statusline +=[%c]

set statusline +=%{exists('*tagbar#currenttag')?tagbar#currenttag('[%s]',''):''}
set statusline +=%{exists('*ale#Escape')?'['.LinterStatus().']':''}
set statusline +=%*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use space as leader
let mapleader = "\<Space>"

" make use of Swedish characters
map å [
map Å {
map ä ]
map Ä }

" reflow current line
map Q gqq
vmap Q gqq

" jump to matching bracket
" nmap <tab> % " conflicts with C-I?
nmap <leader><Tab> %

" jump to next/previous start of method
nmap [f [m
nmap ]f ]m

" fast newline insertion
nmap <leader><BS> O<Esc>j
nmap <leader><CR> o<Esc>k

" jump to a specific tab
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" center screen after scrolling
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz

" quick fix misspelled word
nmap ,z 1z=

" yank from cursor until end of line excluding new line
map Y y$

" always paste on a new line
nmap p :pu<cr>
nmap P :pu!<cr>

" select last paste
nnoremap gp `[v`]

" paste and jump to the first character of the yanked text
noremap p p`[

" wipe all buffers
nnoremap <leader>W :%bd<CR>

" quick save
nnoremap <leader><leader> :w!<CR>

" jump to last active buffer
nnoremap <silent> <leader>e :b#<CR>

" navigate between splitted windows
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

" create new splits
nnoremap <silent> <leader>sh :leftabove  vnew<CR>
nnoremap <silent> <leader>sl :rightbelow vnew<CR>
nnoremap <silent> <leader>sk :leftabove  new<CR>
nnoremap <silent> <leader>sj :rightbelow new<CR>

" create splitted terminals
nnoremap <silent> <leader>th :leftabove  vsplit term://zsh<CR>
nnoremap <silent> <leader>tl :rightbelow vsplit term://zsh<CR>
nnoremap <silent> <leader>tk :leftabove  split term://zsh<CR>
nnoremap <silent> <leader>tj :rightbelow split term://zsh<CR>

" delete backwards
nnoremap <BS> daw

" reselect the text you just entered
nnoremap gV `[v`]

" home row beginning / end of line
noremap H 0
noremap L $

" change/delete until start of line/first word
nnoremap ,C c0
nnoremap ,D d0
nnoremap ,c c^
nnoremap ,d d^

" change word under cursor and dot repeat
nnoremap c* *Ncgn
nnoremap c# #NcgN
vmap c* *Ncgn
vmap c# #NcgN

" change/delete until/til next comma/space
nnoremap c, ct,
nnoremap d, dt,
nmap m, mt,
nnoremap c<space> cf<space>
nnoremap d<space> df<space>
nmap m<space> mf<space>

" get diffs from buffer 1 (LOCAL) and 2 (REMOTE)
nnoremap gdl :diffget 1<CR>
nnoremap gdr :diffget 2<CR>

" select and jump to tag
nmap <C-]> g<C-]>

" pressing Alt+s will trigger substitution, this conflicts with tmux Alt+s to
" switch session so lets disable it
nmap <M-s> <NOP>

" search and replace current word
nnoremap ,s :%s/\(<c-r>=expand("<cword>")<cr>\)/

" yank and reselect yanked block and place cursor at last character
vmap y ygv<Esc>

" keep selection after indention
vnoremap > >gv
vnoremap < <gv

" repeat macro over selected lines
vnoremap @ :norm @q

" open files in new tab
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf

" paste with ctrl-v in insert mode
inoremap <C-v> <C-r>+

" tab / s-tab between options in popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" make dot work over visual line selection
xnoremap . :norm.<CR>

" map ESC in terminal mode
tnoremap <Esc> <C-\><C-n>

" switch window
tnoremap <leader><Tab> <C-\><C-n><c-w>W

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open help in it's own tab
cabbrev help tab help

" insert mode ddate adds date stamp
iab <expr> ddate strftime("%Y-%m-%d")
cab <expr> ddate strftime("%Y-%m-%d")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions and commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move lines easily with only one undo step
" https://www.reddit.com/r/vim/comments/4f79fd/weekly_vim_tips_and_tricks_thread_6/d26lf3l/
function! s:SetUndojoinFlag(mode)
    augroup undojoin_flag
        autocmd!
        if a:mode ==# 'v'
            autocmd CursorMoved * autocmd undojoin_flag CursorMoved * autocmd! undojoin_flag
        else
            autocmd CursorMoved * autocmd! undojoin_flag
        endif
    augroup END
endfunction

function! s:Undojoin()
    if exists('#undojoin_flag#CursorMoved')
        silent! undojoin
    endif
endfunction

nnoremap <silent> <C-M-j> :<C-u>call <SID>Undojoin()<CR>:<C-u>move +1<CR>==:<C-u>call <SID>SetUndojoinFlag('n')<CR>
nnoremap <silent> <C-M-k> :<C-u>call <SID>Undojoin()<CR>:<C-u>move -2<CR>==:<C-u>call <SID>SetUndojoinFlag('n')<CR>
xnoremap <silent> <C-M-j> :<C-u>call <SID>Undojoin()<CR>:<C-u>'<,'>move '>+1<CR>gv=:<C-u>call <SID>SetUndojoinFlag('v')<CR>gv
xnoremap <silent> <C-M-k> :<C-u>call <SID>Undojoin()<CR>:<C-u>'<,'>move '<-2<CR>gv=:<C-u>call <SID>SetUndojoinFlag('v')<CR>gv

" Search for selected text, forwards or backwards.
" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

nnoremap <silent> F12 :call ToggleVExplorer()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup nvimrc_group
    " clear old auto commands
    autocmd!

    " auto reload files after 'updatetime' (4000ms)
    autocmd CursorHold,CursorHoldI * checktime

    " autoreload vim config on save
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC

    " restore last position in buffer
    function! ResCur()
      if line("'\"") <= line("$")
        normal! g`"
        return 1
      endif
    endfunction

    augroup resCur
      autocmd!
      autocmd BufWinEnter * call ResCur()
    augroup END

    " terminal status line
    autocmd TermOpen * setlocal statusline=%{b:terminal_job_id}:\ \%{b:term_title}

    " ignore all other <esc>-prefixed mappings while you are in "fzf mode"
    autocmd FileType fzf tnoremap <nowait><buffer> <esc> <c-g>

    " let terminal resize scale the internal windows
    autocmd VimResized * :wincmd =

    " enter insert mode when starting a new terminal
    autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

    " disable indention for php
    autocmd FileType php filetype indent off

    " redraw diff on updates
    autocmd BufWritePost * if &diff | diffupdate | endif

    " clear jumplist when entering neovim
    autocmd VimEnter * clearjumps

    autocmd BufRead,BufNewFile *.tmpl set filetype=json
    autocmd BufRead,BufNewFile *.avsc set filetype=json

    " populate cwindow with grep results
     autocmd QuickFixCmdPost *grep* cwindow

     " disable automatically insert the current comment leader after hitting
     "  <Enter> in Insert mode.
     autocmd FileType * setlocal formatoptions-=r
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plugins.vim
