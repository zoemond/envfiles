"
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

set mouse=a
"" Undo
set undofile
set undodir=~/.cache/nvim/undo/

" nvimでpythonを使ったpluginを入れるようにする
let g:python3_host_prog = expand('/usr/local/bin/python3')

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

call dein#load_toml(expand('<sfile>:h') . "/dein.toml")

call dein#end()

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------


" ------
" color
" ------
" Important!!
if has('termguicolors')
  set termguicolors
endif

colorscheme gruvbox-material
set background=dark
highlight Visual ctermfg=NONE ctermbg=23   guifg=NONE    guibg=Black

" for coc vim
" 左に出る>>に色を付ける
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
set statusline^=%{coc#status()}
