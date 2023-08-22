# VIMFILES

Settings for VIM and GVIM.

Put these files and directories in the `~/.vim` folder (users `vimfiles` for Windows.)

Author: Carlos Heuberger
Version: 1.0


## VIM initialization

### vim init

first of:

1. variable `VIMINIT`
1. file  `$HOME\_vimrc`
1. file `$HOME\vimfiles\vimrc`
1. file `$VIM\_vimrc`
1. variable `EXINIT`
1. file  `$HOME\_exrc`
1. file `$HOME\vimfiles\exrc`
1. file `$VIM\_exrc`
1. file `$VIMRUNTIME\defaults.vim`

### plugins

1. run scripts `plugin/**/*.vim` under `runtimepath` (`vimfiles`), 
    not from `**/*after/`
1. packages from `start/` under `packpath` (`vimfiles`, `vimfiles/after`)
1. scripts and packages from `after` directories (skipped on previous steps)

### gui init

first of:

1. variable `GVIMINIT`
1. file  `$HOME\_gvimrc`
1. file `$HOME\vimfiles\gvimrc`
1. file `$VIM\_gvimrc`
