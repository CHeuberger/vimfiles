" Syntax: RUST
" Maintainer: Carlos F Heuberger

if exists("b:current_syntax")
  finish
endif

let s:keepcpo= &cpo
set cpo&vim
"-----------------------------------------------------------------------------

set makeprg=cargo\ build

"-----------------------------------------------------------------------------
let &cpo = s:keepcpo
unlet s:keepcpo
