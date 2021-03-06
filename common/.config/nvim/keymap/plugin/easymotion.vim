" for easy motion
let mapleader = "\<Space>" 
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)

map  <Leader>b <Plug>(easymotion-b)
map  <Leader>e <Plug>(easymotion-e)
