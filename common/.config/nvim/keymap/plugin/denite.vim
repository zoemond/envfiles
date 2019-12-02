"denite時に使用するキーマップ
"ESCキーでdeniteを終了
call denite#custom#map('insert', '<esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')
"C-N,C-Pで上下移動
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
"C-J,C-Kでsplitで開く
"call denite#custom#map('insert', '<C-j>', '<denite:do_action:split>', 'noremap')
"call denite#custom#map('insert', '<C-k>', '<denite:do_action:vsplit>', 'noremap')

" 以下はdenite起動時に使用するキーマップ
" バッファ一覧
noremap <C-P> :Denite buffer<CR>
" ファイル一覧
noremap <C-N> :Denite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Denite file_old<CR>
" カレントディレクトリ
noremap <C-C> :Denite file_rec<CR>
"バッファ一覧
nnoremap sB :<C-u>Denite buffer -buffer-name=file<CR>

"Denite でバッファ内検索 
nnoremap <silent> <Leader><C-f> :<C-u>Denite line<CR>
nnoremap <silent> <expr><Space>l ":<C-u>DeniteWithCursorWord line<CR>"
