" Test Syntax file
" Maintainer: Carlos F Heuberger

if exists("b:current_syntax")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim
"-----------------------------------------------------------------------------

set makeprg=cargo\ build
" echomsg 'RUST Syntax file reloaded'

"-----------------------------------------------------------------------------
" let b:current_syntax = "tst"
let &cpo = s:keepcpo
unlet s:keepcpo

" vim:ts=18  sw=2  fdm=marker
