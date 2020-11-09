if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comment stuff out
Plug 'tpope/vim-commentary'
" unix helpers (Rename, Move, Chmod etc)
Plug 'tpope/vim-eunuch'
" enable repeating supported plugin maps with . (dot)
Plug 'tpope/vim-repeat'
" readline style insertion
Plug 'tpope/vim-rsi'
" Set the 'path' option for miscellaneous file types
Plug 'tpope/vim-apathy'
" ctags generator
Plug 'szw/vim-tags'
" allows you to open items from quickfix or location list
Plug 'yssl/QFEnter'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" adds various text objects to give you more targets to operate on
Plug 'wellle/targets.vim'
" collection of language packs
Plug 'sheerun/vim-polyglot'
" a git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
  " github extension for fugitive.vim
  Plug 'tpope/vim-rhubarb'
  " a git commit browser
  Plug 'junegunn/gv.vim'
" make quickfick window editable
Plug 'stefandtw/quickfix-reflector.vim'
" provides the ability to sort in Vim using text objects and motions
Plug 'christoomey/vim-sort-motion'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" modern buffer manager
Plug 'zefei/vim-wintabs'
" shows a git diff in the gutter column) and stages/undoes hunks
Plug 'airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text and search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" wrap and unwrap function arguments, lists, and dictionaries
Plug 'FooSoft/vim-argwrap'
" an ack/ag/pt/rg powered code search and view tool
Plug 'dyng/ctrlsf.vim'
" create your own text objects
Plug 'kana/vim-textobj-user'
  " text objects for entire buffer
  Plug 'kana/vim-textobj-entire'
" allows you to visually select increasingly larger regions of text using
" the same key combination
Plug 'terryma/vim-expand-region'
" defines a new text object, based on indentation levels
Plug 'michaeljsmith/vim-indent-object'
" make the yanked region apparent
Plug 'machakann/vim-highlightedyank'
" provides an easy way to browse the tags of the current file and get an
" overview of its structure. requires ctags
Plug 'majutsushi/tagbar'
" pasting in Vim with indentation adjusted to destination context
Plug 'sickill/vim-pasta'
" overrides the delete operations to actually just delete and not affect the
" current yank
Plug 'svermeulen/vim-cutlass'
" provides operator motions to quickly replace text
Plug 'svermeulen/vim-subversive'
" motion through CamelCaseWords and underscore_notation
Plug 'vim-scripts/camelcasemotion'
" display number of search matches & index of a current match
Plug 'google/vim-searchindex'
" spot your cursor with simple search
" Plug 't9md/vim-smalls'
" a better (hopefully) :Join command
Plug 'sk1418/Join'
" highlighting word under cursor and all of its occurrences
Plug 'dominikduda/vim_current_word'
" a command-line fuzzy finder
Plug 'junegunn/fzf',                            { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
" move function arguments left and right
Plug 'AndrewRadev/sideways.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto completion, linting & formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dark powered asynchronous completion framework
" 5.2 not working as of 2020-02-24
" Plug 'Shougo/deoplete.nvim',                    { 'do': ':UpdateRemotePlugins', 'tag': '5.1' }
Plug 'Shougo/deoplete.nvim',                    { 'do': ':UpdateRemotePlugins' }
  " insert mode completion of words in adjacent tmux panes
  Plug 'wellle/tmux-complete.vim'
  " deoplete.nvim source for python
  Plug 'deoplete-plugins/deoplete-jedi',        { 'for': 'python' }
" code formatter
Plug 'sbdchd/neoformat',                        { 'for': 'python' }
" check syntax asynchronously and fix files
Plug 'w0rp/ale',                                { 'for': ['python', 'markdown', 'java', 'javascript'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text objects for Python
Plug 'bps/vim-textobj-python',                  { 'for': 'python' }
" run your tests with py.test
Plug 'alfredodeza/pytest.vim',                  { 'for': 'python' }
" enhanced version of the original Python syntax highlighting script
Plug 'kh3phr3n/python-syntax',                  { 'for': 'python' }
" a nicer Python indentation style
Plug 'Vimjas/vim-python-pep8-indent',           { 'for': 'python' }
" extend the % motion and define g%, [%, and ]% motions
Plug 'vim-scripts/python_match.vim',            { 'for': 'python' }
" sort python imports
Plug 'fisadev/vim-isort',                       { 'for': 'python' }
" Plug 'psf/black',                               { 'for': 'python' }
" let g:black_linelength = 100

" jedi-vim is a VIM binding to the auto completion library Jedi
Plug 'davidhalter/jedi-vim',                    { 'for': 'python', 'commit': 'a0207fadf9f165adac61f01abc07db0ae898cbe6' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Java
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'autozimu/LanguageClient-neovim',          { 'for': 'java', 'branch': 'next', 'do': 'bash install.sh' }
Plug 'artur-shaik/vim-javacomplete2',           { 'for': 'java' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" much simpler rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim',        { 'for': 'clojure' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PHP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi-language DBGP debugger client
Plug 'joonty/vdebug',                           { 'for': 'php', 'on':  'VdebugStart' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text filtering and alignment
Plug 'godlygeek/tabular',                       { 'for': 'markdown' }
  " syntax highlighting, matching rules and mappings for the original Markdown
  " and extensions.
  Plug 'plasticboy/vim-markdown',               { 'for': 'markdown' }
" run async shell commands
Plug 'skywind3000/asyncrun.vim',                { 'for': 'markdown' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JSON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically pretty-print and indent JSON files
Plug 'bcicen/vim-jfmt'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YAML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatic yaml formatter
Plug 'tarekbecker/vim-yaml-formatter',          { 'for': 'yaml' }

call plug#end()
