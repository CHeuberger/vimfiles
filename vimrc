" vimrc: initial settings for VIM
" Author: Carlos Heuberger
" Version: 1.1

" already done for EVIM
if v:progname =~? "evim"
  finish
endif

" Load once
if exists("g:loaded_init")
    finish
endif
let g:loaded_init = 1

set nocompatible

behave mswin

set backspace=indent,eol,start
set backup              " keep a backup file
set patchmode=.bak      " and the original
set display=truncate    " show @@@ in last line if truncated
set encoding=utf-8
set noexpandtab
set guifont=DejaVu_Sans_Mono:h10:cANSI
set guioptions+=!       " no console for external commands
set history=200         " keep 200 lines of command line history
set incsearch           " do incremental searching
set laststatus=2        " always show status line
set modeline            " check for modelines
set nrformats-=octal    " do not increment/decrement as octal
set number              " show line numbers
set ruler               " show the cursor position all the time
set shiftwidth=4
set showcmd             " display incomplete commands
set softtabstop=4
set whichwrap+=<,>,[,]
set wildmenu            " enhanced mode for command-line completion
set wildoptions+=pum    " command-line completion in popup menu

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

" Use the internal diff if available.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Command to see the difference between the current buffer and the original
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif


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

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

nmap <Leader>k :lv <cword> **/*.h **/*.c<CR>
nmap <Leader>l :lli<CR>
nmap <Leader>n :lne<CR>
nmap <Leader>m :lp<CR>

nmap <unique> <F11> :make %<CR>

nmap <Leader>[ :N<CR>
nmap <Leader>] :n<CR>

map <F7> :if exists("g:syntax_on") <Bar>
         \  syntax off <Bar>
         \else <Bar>
         \  syntax enable <Bar>
         \endif <CR>

" Only if compiled with +eval
if 1

  " file type detection
  filetype plugin indent on
  
  augroup vimStartup
    au!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
  augroup END

""  " au BufNewFile,BufRead *_pt_BR.properties set spell spelllang=pt_br fenc=latin1
""  " au BufNewFile,BufRead *_pt.properties set spell spelllang=pt fenc=latin1
""  " au BufNewFile,BufRead *_pt set spell spelllang=pt fenc=latin1

endif " 1


" The matchit plugin makes the % command work better
if has('syntax') && has('eval')
  packadd! matchit
endif
