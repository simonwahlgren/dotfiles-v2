" A dark Arch inspired colorscheme
" Author: Simon Wahlgren <simon.wahlgren@gmail.com>
" Maintainer: Simon Wahlgren <simon.wahlgren@gmail.com>

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="darch"
let s:none = ['none', 'none']

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

let s:bold = 'bold,'
let s:underline = 'underline,'

" Color palette
let s:black = ["#000000", 0]
let s:white = ["#000000", 255]
let s:blue = ["#000000", 26]
let s:darkblue = ["#000000", 20]
let s:lightblue = ["#000000", 33]
let s:lightgrey = ["#000000", 249]
let s:darkgrey = ["#000000", 234]
let s:grey = ["#000000", 238]
let s:purple = ["#000000", 55]
let s:lightpurple = ["#000000", 91]

" Memoize colors
call s:HL('white', s:white)
call s:HL('black', s:black)

call s:HL('blue', s:blue)
call s:HL('darkblue', s:darkblue)
call s:HL('lightblue', s:lightblue)
call s:HL('lightblue_bold', s:lightblue, s:none, s:bold)
call s:HL('blue_bold', s:blue, s:none, s:bold)

call s:HL('grey', s:grey)
call s:HL('darkgrey', s:darkgrey)
call s:HL('lightgrey', s:lightgrey)
call s:HL('lightgrey_bold', s:lightgrey, s:none, s:bold)

call s:HL('purple', s:purple)
call s:HL('lightpurple', s:lightpurple)
call s:HL('purple_bold', s:purple, s:none, s:bold)
call s:HL('lightpurple_bold', s:lightpurple, s:none, s:bold)

" --------------------------------
" Editor settings
" --------------------------------
call s:HL('Normal', s:lightgrey)
call s:HL('CursorLine', s:lightgrey, s:darkgrey, s:bold)

" Hide black line tildas
highlight NonText ctermfg=0
highlight EndOfBuffer ctermfg=0

hi! link LineNr grey
hi! link CursorLineNR blue

hi Cursor          ctermfg=none    ctermbg=none    cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=none    cterm=none
call s:HL('ColorColumn', s:none, s:darkgrey)

" -------------------------
" - Window/Tab delimiters -
" -------------------------
hi! link VertSplit darkgrey
call s:HL('TabLine', s:lightgrey, s:none)
call s:HL('TabLineSel', s:blue, s:none)
call s:HL('TabLineFill', s:grey, s:none)

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
call s:HL('IncSearch', s:lightblue, s:darkgrey, s:bold)
call s:HL('Search', s:lightpurple, s:darkgrey, s:bold)

hi Directory       ctermfg=none    ctermbg=none    cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi! link StatusLine blue

hi StatusLineNC    ctermfg=none    ctermbg=none    cterm=none
hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

hi! link Title blue
" --------------
" - Visual aid -
" --------------
call s:HL('Visual', s:lightpurple, s:darkgrey, s:bold)
hi! link MatchParen purple
hi! link Error purple
hi! link Todo purple

hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=none    ctermbg=none    cterm=none
hi Todo            ctermfg=none    ctermbg=none    cterm=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=none    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none

" listchars - not working?
hi! link SpecialKey grey

" --------------------------------
" Diff
" --------------------------------
call s:HL('DiffAdd', s:lightblue, s:darkgrey, s:bold)
call s:HL('DiffText', s:lightblue, s:darkgrey, s:bold)

hi! link DiffChange blue_bold
hi! link DiffDelete grey

" --------------------------------
" Completion menu
" --------------------------------
hi! link Pmenu blue
call s:HL('PmenuSel', s:lightblue, s:darkgrey, s:bold)

hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=none    cterm=underline
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi! link Boolean purple_bold
hi! link Character String
hi! link Constant String
hi! link Float purple_bold
hi! link Number purple_bold
hi! link String lightblue
hi! link StringDelimiter StringDelimiter

" --------------------------------
" Language constructs
" --------------------------------
hi! link Comment grey
hi! link Conditional blue_bold
hi! link Define purple_bold
hi! link Exception blue_bold
hi! link Function blue_bold
hi! link Identifier lightgrey_bold
hi! link Include blue_bold
hi! link Keyword blue_bold
hi! link Label blue_bold
hi! link Operator lightpurple
hi! link PreProc lightpurple_bold
hi! link Repeat blue_bold
hi! link Special grey
hi! link SpecialComment grey
hi! link Statement blue_bold
hi! link Structure purple_bold
hi! link Type blue_bold

hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none
call s:HL('Whitespace', s:blue, s:darkgrey)
"---------------------------------
" Python specific language constructs
"---------------------------------
hi! link pythonDocstring Special
hi! link pythonDef purple
hi! link pythonClassDef purple

"---------------------------------
" Custom colors, used in statusbar
"---------------------------------
hi! link User1 blue_bold
hi! link User2 blue

" --------------------------------
" Ale
"---------------------------------
hi! link ALEErrorSign grey
hi! link ALEWarningSign grey

"---------------------------------
" EasyMotion
"---------------------------------
hi! link EasyMotionIncSearchDefault lightblue

"---------------------------------
" FZF
"---------------------------------
hi! link FZFCursorLine lightgrey
hi! link FZFStatement lightblue_bold
hi! link FZFPreProc lightpurple_bold
hi! link FZFComment blue_bold

hi link FZFNormal Normal
hi link FZFComent Comment
hi link FZFCursorColumn CursorColumn
hi link FZFConditional Conditional
hi link FZFException Exception
hi link FZFKeyword Keyword
hi link FZFLabel Label

"--------------------------------
" Highlightedyank
"--------------------------------
hi! link HighlightedyankRegion lightpurple_bold

highlight CursorWord0 term=underline cterm=underline gui=underline

"--------------------------------
" vim-signature
"--------------------------------
hi! link SignatureMarkText purple

"--------------------------------
" Clever-F
"--------------------------------
hi link CleverFDefaultLabel Search

"--------------------------------
" Quick Scope
"--------------------------------
hi link QuickScopePrimary Search

"--------------------------------
" Sneak
"--------------------------------
call s:HL('SneakLabel', s:white, s:lightpurple, s:bold)

"--------------------------------
" Gitgutter
"--------------------------------
hi! link GitGutterAdd grey
hi! link GitGutterChange grey
hi! link GitGutterDelete grey

"--------------------------------
" Coc
"--------------------------------
hi CocErrorSign ctermfg=238
hi CocWarningSign ctermfg=238
hi CocInfoSign ctermfg=238
hi CocHintSign ctermfg=238

hi CocErrorFloat ctermfg=red
hi CocWarningFloat ctermfg=red
hi CocInfoFloat ctermfg=red
hi CocHintFloat ctermfg=blue

"--------------------------------
" LSP
"--------------------------------
hi! link DiagnosticsDefaultHint blue
hi! link DiagnosticsSignHint grey

hi! link DiagnosticsDefaultError blue
hi! link DiagnosticsSignError DiagnosticsSignHint

hi! link DiagnosticsDefaultWarning blue
hi! link DiagnosticsSignWarning DiagnosticsSignHint

hi! link DiagnosticsDefaultInformation blue
hi! link DiagnosticsSignInformation DiagnosticsSignHint

call s:HL('DiagnosticsUnderlineError', s:white, s:grey)
hi! link DiagnosticsUnderlineWarning DiagnosticsUnderlineError
hi! link DiagnosticsUnderlineInformation DiagnosticsUnderlineError
hi! link DiagnosticsUnderlineHint DiagnosticsUnderlineError

"--------------------------------
" Nvim
"--------------------------------
hi! link FloatBorder darkgrey
