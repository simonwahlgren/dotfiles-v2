" if version < 600
"   syntax clear
" elseif exists("b:current_syntax")
"   finish
" endif
" 
" syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
" syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
" 
" syn keyword pythonDef def nextgroup=pythonFunction skipwhite
" syn keyword pythonClassDef class nextgroup=pythonClass skipwhite
" 
" let b:current_syntax = "python"
