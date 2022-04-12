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
let g:polyglot_disabled = ['python', 'markdown', 'php']
Plug 'sheerun/vim-polyglot'
" a git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
  " github extension for fugitive.vim
  Plug 'tpope/vim-rhubarb'
" make quickfick window editable
Plug 'stefandtw/quickfix-reflector.vim'
" plugin to preview the contents of the registers
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
let g:registers_window_border = "single"

" a pretty diagnostics list to help you solve all the trouble your code is causing
Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/trouble.nvim'

nnoremap gD <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap gR <cmd>TroubleToggle references<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" modern buffer manager
Plug 'zefei/vim-wintabs'

" shows a git diff in the gutter column and stages/undoes hunks
" Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'sindrets/diffview.nvim'

" Plug 'nvim-lualine/lualine.nvim'

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
" provides the ability to sort in Vim using text objects and motions
Plug 'christoomey/vim-sort-motion'
" defines a new text object, based on indentation levels
Plug 'michaeljsmith/vim-indent-object'
" make the yanked region apparent
Plug 'machakann/vim-highlightedyank'
" provides an easy way to browse the tags of the current file and get an
" overview of its structure. requires ctags
Plug 'majutsushi/tagbar'
" pasting in Vim with indentation adjusted to destination context
Plug 'sickill/vim-pasta'
" overrides the delete operations to actually just delete and not affect the current yank
Plug 'svermeulen/vim-cutlass'
" provides operator motions to quickly replace text
Plug 'svermeulen/vim-subversive'
" motion through CamelCaseWords and underscore_notation
Plug 'vim-scripts/camelcasemotion'
" display number of search matches & index of a current match
Plug 'google/vim-searchindex'
" a better (hopefully) :Join command
Plug 'sk1418/Join'
" highlighting word under cursor and all of its occurrences
Plug 'dominikduda/vim_current_word'
" a command-line fuzzy finder
Plug 'junegunn/fzf',                            { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
" move function arguments left and right
Plug 'AndrewRadev/sideways.vim'
" a powerful grammar checker for Vim using LanguageTool
Plug 'rhysd/vim-grammarous'

Plug 'phaazon/hop.nvim'

" alignment
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto completion, linting & formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Intellisense engine for Vim8 & Neovim, full language server protocol support
" as VSCode
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"   " This plugin uses FZF fuzzy finder in place of Coc's built-in CocList
"   " sources as well as Coc's jumps (definition, reference etc).
"   Plug 'antoinemadec/coc-fzf'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'lukas-reineke/cmp-rg'
" Plug 'mattn/efm-langserver'
Plug 'jose-elias-alvarez/null-ls.nvim'

" LSP signature hint as you type
" Plug 'ray-x/lsp_signature.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text objects for Python
Plug 'bps/vim-textobj-python',                  { 'for': 'python' }
" enhanced version of the original Python syntax highlighting script
"Plug 'kh3phr3n/python-syntax',                  { 'for': 'python' }
Plug 'vim-python/python-syntax',                { 'for': 'python' }
" a nicer Python indentation style
Plug 'Vimjas/vim-python-pep8-indent',           { 'for': 'python' }
" extend the % motion and define g%, [%, and ]% motions
Plug 'vim-scripts/python_match.vim',            { 'for': 'python' }
" jedi-vim is a VIM binding to the auto completion library Jedi
" only used for :Pyimport feature
" Plug 'davidhalter/jedi-vim',                    { 'for': 'python' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Java
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'autozimu/LanguageClient-neovim',          { 'for': 'java', 'branch': 'next', 'do': 'bash install.sh' }
" Plug 'artur-shaik/vim-javacomplete2',           { 'for': 'java' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" much simpler rainbow parentheses
" Plug 'junegunn/rainbow_parentheses.vim',        { 'for': 'clojure' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PHP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" multi-language DBGP debugger client
" Plug 'joonty/vdebug',                           { 'for': 'php', 'on':  'VdebugStart' }

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
let g:yaml_formatter_indent_collection=1

call plug#end()
