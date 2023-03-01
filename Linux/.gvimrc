colorscheme onedark

" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''




inoremap é i
noremap é i
vnoremap ã "*y
noremap ö "*p
inoremap ö <Esc>"*p<Bar>i
vnoremap ø "*d


noremap / :noh<CR>/

set guioptions+=r

vnoremap <C-c> "+y
set guicursor+=n-v-c:blinkon0


nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
