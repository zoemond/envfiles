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


" map prefix
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     z        [ff]
xmap     z        [ff]


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


" ---------
" coc.nvim
" ---------
" 左に出る>>に色を付ける
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint8', 'coc-prettier', 'coc-git', 'coc-fzf-preview', 'coc-lists', 'coc-spell-checker']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
set statusline^=%{coc#status()}


inoremap <silent> <expr> <C-Space> coc#refresh()
nnoremap <silent> K       :<C-u>call <SID>show_documentation()<CR>
nmap     <silent> [dev]rn <Plug>(coc-rename)
nmap     <silent> [dev]a  <Plug>(coc-codeaction-selected)iw

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> [ff]rf :<C-u>CocCommand fzf-preview.CocReferences<CR>

function! s:coc_typescript_settings() abort
  nnoremap <silent> <buffer> [dev]f :<C-u>CocCommand eslint.executeAutofix<CR>:CocCommand prettier.formatFile<CR>
endfunction

augroup coc_ts
  autocmd!
  autocmd FileType typescript,typescriptreact call <SID>coc_typescript_settings()
augroup END

function! s:show_documentation() abort
  if index(['vim','help'], &filetype) >= 0
    execute 'h ' . expand('<cword>')
  elseif coc#rpc#ready()
    call CocActionAsync('doHover')
  endif
endfunction

" ------
"" treesitter
" ------
lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "typescript",
    "tsx",
    "javascript",
    "graphql",
    "jsdoc",
    "rust",
    "ruby",
    "python",
    "lua",
    "json",
    "yaml",
    "markdown",
    "dockerfile",
    "html",
    "css",
    "comment",
  },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true
  }
}
EOF

" ------
" fzf preview
" ------
nnoremap <silent> [ff]q  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> <C-p>  :<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>
nnoremap <silent> [ff]s  :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [ff]gg :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [ff]b  :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap          [ff]f  :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>
nnoremap <silent> [ff]o  :<C-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>
xnoremap          [ff]f  "sy:CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

" ------
" fern
" ------
nnoremap <silent> <C-E> :<C-u>Fern . -drawer -reveal=%<CR>


" ------
" git blame
" ------
let g:blamer_enabled = 1
let g:blamer_delay = 500


nnoremap go <Plug>(getpr-open)


