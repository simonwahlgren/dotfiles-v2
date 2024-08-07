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
" a git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
  " github extension for fugitive.vim
  Plug 'tpope/vim-rhubarb'
" make quickfick window editable
Plug 'stefandtw/quickfix-reflector.vim'
" plugin to preview the contents of the registers
" Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
" let g:registers_window_border = "single"

" a pretty diagnostics list to help you solve all the trouble your code is causing
Plug 'kyazdani42/nvim-web-devicons'
  Plug 'folke/trouble.nvim'

" embed your vim statusline in tmux
Plug 'vimpostor/vim-tpipeline'
let g:tpipeline_autoembed = 0
let g:tpipeline_statusline = '%f'

" use as inspiration
" Plug 'nyoom-engineering/oxocarbon.nvim'
"
" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you
" can see the contents of the registers.
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_window = 'vert bo 100new'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" modern buffer manager
Plug 'zefei/vim-wintabs'

" Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
"   " changing the way of how to use tabs on neovim. This plugin scopes
"   " buffers to tabs cleaning up tabline plugins like bufferline.nvim
"   Plug 'tiagovla/scope.nvim'

" Plug 'b0o/incline.nvim'

" shows a git diff in the gutter column and stages/undoes hunks
" Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'sindrets/diffview.nvim'

" if you get Unknown function firenvim#install
" nvim --headless "+call firenvim#install(0) | q"
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'takeover': 'never',
        \ },
    \ }
\ }
" Plug 'projekt0n/github-nvim-theme'

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
" conflicts with cmdheight=0
" Plug 'google/vim-searchindex'
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
" Plug 'rhysd/vim-grammarous'

Plug 'phaazon/hop.nvim'

" alignment
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gA <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gA <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto completion, linting & formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neovim/nvim-lspconfig'
  " Neovim plugin that allows you to manage LSP servers
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'lukas-reineke/cmp-rg'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'github/copilot.vim'

" LSP signature hint as you type
" Plug 'ray-x/lsp_signature.nvim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text objects for Python
Plug 'bps/vim-textobj-python',                  { 'for': 'python' }
" enhanced version of the original Python syntax highlighting script
" testing treesitter
" Plug 'vim-python/python-syntax',                { 'for': 'python' }
" a nicer Python indentation style
" testing treesitter
Plug 'Vimjas/vim-python-pep8-indent',           { 'for': 'python' }
" extend the % motion and define g%, [%, and ]% motions
Plug 'vim-scripts/python_match.vim',            { 'for': 'python' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text filtering and alignment
Plug 'godlygeek/tabular',                       { 'for': 'markdown,csv' }
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terraform
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'hashivim/vim-terraform',          { 'for': 'terraform' }

call plug#end()
