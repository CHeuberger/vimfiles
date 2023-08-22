" Settings: .sql files
" Author: Carlos Heuberger
" Version: 1.0

set autoindent
set expandtab
set foldmethod=syntax
set shiftwidth=3
set softtabstop=3

if 0

  set foldmethod=expr
  set foldexpr=FOLDSQL(v:lnum)

  func! FOLDSQL(lnum)
    let line = getline(a:lnum)
    if line =~? '\<PROCEDURE\>\|\<FUNCTION\>'
      return '>1'
    elseif line =~? '\<END\>\s\+\<IF\>'
      return 's1'
    elseif line =~? '\<IF\>'
      return 'a1'
    elseif line =~? '\<END\>\s\+\<LOOP\>'
      return 's1'
    elseif line =~? '\<FOR\>.*\<IN\>'
      return 'a1'
    elseif line =~? '\<BEGIN\>'
      return 'a1'
    elseif line =~? '\<END\>'
      return 's1'
    else
      return '='
    endif
  endfunc

endif
