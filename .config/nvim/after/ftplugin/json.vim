setlocal foldmethod=syntax
setlocal tabstop=2
setlocal shiftwidth=2

" enable folding
" https://github.com/nvim-treesitter/nvim-treesitter/issues/1337
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
