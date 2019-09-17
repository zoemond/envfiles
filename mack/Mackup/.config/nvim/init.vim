" nvimのでpythonを使ったpluginを入れるようにする
let g:python3_host_prog = expand('/usr/local/bin/python3')

"dein Scripts----------------------------- 
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein') 
  call dein#begin('~/.cache/dein')

  "Original
  call dein#load_toml(expand('<sfile>:h') . "/dein.toml")

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
"End dein Scripts------------------------- 

set mouse=a
colorscheme desert 
