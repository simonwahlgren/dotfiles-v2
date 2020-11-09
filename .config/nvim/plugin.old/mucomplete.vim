if &runtimepath =~ 'vim-mucomplete'
    set noshowmode shortmess+=c
    set completeopt-=preview
    set completeopt+=menu,menuone,noinsert,noselect,longest
    let g:mucomplete#enable_auto_at_startup = 1
    let g:mucomplete#chains = {
        \ 'default' : ['incl', 'omni', 'file']
        \ }
    let g:mucomplete#chains.markdown = ['keyn', 'file']  ", 'spel']
endif
