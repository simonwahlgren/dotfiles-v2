let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" let g:rainbow#colors = {
" \   'dark': [
" \     ['91',  'orange1'     ],
" \     ['27',   'yellow1'     ],
" \     ['135',    'greenyellow' ],
" \     ['39', 'green1'      ],
" \     ['167',     'springgreen1'],
" \     ['105',  'cyan1'       ],
" \     ['218',   'slateblue1'  ],
" \     ['cyan',    'magenta1'    ],
" \     ['magenta', 'purple1'     ]
" \   ]
" \ }

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
