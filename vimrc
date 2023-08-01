" init.vim: Vim initial settings plugin
" Maintainer:Carlos Heuberger

" Load once
if exists("g:loaded_init")
    finish
endif
let g:loaded_init = 1

set nocompatible

behave mswin

set backspace=indent,eol,start
set backup		" keep a backup file
set guifont=DejaVu_Sans_Mono:h10:cANSI
set encoding=utf-8
set history=50		" keep 50 lines of command line history
set incsearch		" do incremental searching
set laststatus=2        " always show status line
set modeline		" check for modelines
set number              " show line numbers
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set whichwrap+=<,>,[,]
set shiftwidth=4
set softtabstop=4
set noexpandtab

if has("gui_running")
  set columns=120
  set lines=40
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if !has("autocmd")
  set autoindent
endif

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" backspace in Visual mode deletes selection
vnoremap <BS> d

" SHIFT-Del are Cut
vnoremap <S-Del> "+x

" CTRL-Insert are Copy
vnoremap <C-Insert> "+y

" SHIFT-Insert are Paste
noremap <S-Insert> "+gP
noremap <C-V> "+gP
inoremap <C-V> <C-R>+
cnoremap <S-Insert> <C-R>+
cnoremap <C-V> <C-R>+

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

nmap <Leader>k :lv <cword> **/*.h **/*.c<CR>
nmap <Leader>l :lli<CR>
nmap <Leader>n :lne<CR>
nmap <Leader>m :lp<CR>

nmap <unique> <F11> :make %<CR>

nmap <Leader>[ :N<CR>
nmap <Leader>] :n<CR>

""if has("autocmd")
""  filetype plugin indent on
""  augroup vimrcEx
""    au!
""    " autocmd FileType text setlocal textwidth=78
""    autocmd BufReadPost *
""      \ if line("'\"") > 0 && line("'\"") <= line("$") |
""      \   exe "normal g`\"" |
""      \ endif
""  augroup END
""
""  " au BufNewFile,BufRead *_pt_BR.properties set spell spelllang=pt_br fenc=latin1
""  " au BufNewFile,BufRead *_pt.properties set spell spelllang=pt fenc=latin1
""  " au BufNewFile,BufRead *_pt set spell spelllang=pt fenc=latin1
""else
""  set autoindent		" always set autoindenting on
""endif " has("autocmd")



""echomsg 'pack init.vim loaded'
" vim:sw=2 sts=2
