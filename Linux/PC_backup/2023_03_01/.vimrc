packadd termdebug
let g:termdebug_wide = 1

call plug#begin('~/.vim/plugged')


Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'leafgarland/typescript-vim'

Plug 'axvr/org.vim'
"Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags'
"
Plug 'bling/vim-bufferline'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'ycm-core/YouCompleteMe'
Plug 'rhysd/vim-clang-format'

Plug 'mbbill/undotree'

Plug 'Yggdroot/indentLine'
call plug#end()



let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set guicursor+=a:blinkon0



set nocompatible              " be iMproved, required
syntax on

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set exrc  " local override of _vimrc or .vimrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set scrolloff=0
set sidescroll=1
set sidescrolloff=3
set guioptions=egt
set signcolumn=yes
set backspace=indent,eol,start
set incsearch
set hlsearch
set updatetime=1000
set notimeout
set nottimeout
" set timeoutlen=100
" set ttimeoutlen=5
" set cursorline
set shortmess-=S

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set encoding=utf-8

set listchars=trail:∙,extends:>,precedes:<,eol:$
set list

" set guifont=Ubuntu\ Mono:h16
set guifont=UbuntuMono\ 11
" set guifontwide=HGGothicM:h16


set colorcolumn=80

highlight ColorColumn ctermbg=0 guibg=lightgrey


" ----------------------------------------------------------------------
" color schemes
" ----------------------------------------------------------------------
let g:onedark_terminal_italics=1
" let g:onedark_termcolors=256
" set t_Co=256
colorscheme onedark
" colorscheme palenight
" colorscheme gruvbox
if (has("termguicolors"))
  set termguicolors
endif
" ----------------------------------------------------------------------
"
" parentheses
"


if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    " autocmd ColorScheme * call onedark#extend_highlight("Function", { "cterm": "bold" })
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
  augroup END
endif

set background=dark
hi Function cterm=bold
set cursorline


if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_custom_ignore = '\v[\/]\.(cache|git)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlq_custom_ignore = '.cache'
let g:ctrlp_use_caching = 0


let g:netrw_winsize=75
let g:netrw_browse_split=2
let g:netrw_banner=0



let mapleader=" "

" NerdTree settings
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
" let g:webdevicons_enable_nerdtree = 1
"
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" au BufReadPost *.txt set syntax=org

nnoremap <Leader>op :NERDTreeToggle<CR>


" YCM settings
set completeopt-=preview
let g:ycm_python_interpreter_path = '~/miniconda3/envs/plot/bin/python3.9'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_always_populate_location_list = 1

nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>yd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>yf :YcmCompleter FixIt<CR>
nnoremap <leader>ys :YcmCompleter GoToSymbol<SPACE>
nnoremap <leader>yen :lnext<CR>
nnoremap <leader>yep :lprevious<CR>

" clang-format
" vnoremap <buffer><leader>fc :ClangFormat<CR>
" nnoremap <buffer><leader>fc :ClangFormat<CR>
" map<C-c><C-k> :pyf /usr/share/clang/clang-format-10/clang-format.py<CR>
let g:clang_format#style_options = {
            \ "ColumnLimit" : 80,
            \ "Standard" : "C++11"}
" nnoremap <leader>cf :clang_format<CR>
noremap <leader>cf :ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

"serch settings
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>pf :CtrlP<CR>
nnoremap <leader>ff :CtrlP<CR>
nnoremap <C-p> :CtrlP<CR>

nnoremap <leader>bb :CtrlPBuffer<CR>
nnoremap <leader>bo :CtrlPMRU<CR>

" commentary
noremap <leader>/ :Commentary<CR>

" git
nnoremap <leader>gA :Git add .<CR>
nnoremap <leader>GA :Git add .<CR>
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gg :Git commit -m "
nnoremap <leader>gs :Git<CR>
nnoremap <leader>g<Esc> <Esc>
nnoremap <leader>G<Esc> <Esc>


" status line settings
let g:bufferline_echo = 0


" Basic keybindings
nnoremap s :w<CR>
nnoremap S :w<CR>
noremap <silent>~ :noh<CR><Esc>

" copy and paste
vnoremap <C-c> "+y


" vim surround
vmap s S


tnoremap <Esc> <C-\><C-n>


" window
nnoremap <silent><leader><Esc> :noh<Esc>
nnoremap <leader><C-g> <Esc>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w<Esc> <Esc>
nnoremap <leader>w<C-g> <Esc>

nnoremap <leader>wc :wincmd c<CR>
nnoremap <leader>wo :wincmd c<CR>
nnoremap <leader>wv :wincmd v<CR>
nnoremap <leader>wh :sp<CR>
nnoremap <leader>wi :wincmd i<CR>
nnoremap <leader>ww :wincmd w<CR>
nnoremap <leader>w\| :wincmd \|<CR>
nnoremap <leader>w_ :wincmd _<CR>
nnoremap <leader>w= :wincmd =<CR>

nnoremap <leader>fp :e $MYVIMRC<CR>
nnoremap <leader>f<Esc> <Esc>
nnoremap <leader>f<C-g> <Esc>





" scrolling
noremap <C-j> 20<C-d>
noremap <C-k> 20<C-u>
noremap J 10<C-d>
noremap K 10<C-u>

nnoremap <C-[>j :m .+1<CR>==
nnoremap <C-[>k :m .-2<CR>==
inoremap <C-[>j <Esc>:m .+1<CR>==gi
inoremap <C-[>k <Esc>:m .-2<CR>==gi
vnoremap <C-[>j :m '>+1<CR>gv=gv
vnoremap <C-[>k :m '<-2<CR>gv=gv






" open
nnoremap <leader>ow :wincmd c<CR>
nnoremap <leader>ou :UndotreeShow<CR>
nnoremap <leader>ot :term<CR>

nnoremap <leader>o<Esc> <Esc>
nnoremap <leader>o<C-g> <Esc>


" Terminal toggle
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #"
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "topleft split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "topleft split"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

" airline 

let g:airline#extensions#whitespace#enabled=0
let g:airline_section_c='%f'
let g:airline_section_y=''
let g:airline_section_z='%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#'
let g:airline_skip_empty_sections = 1

if has("gui_running")
    let g:airline_theme='onedark'
else
    let g:airline_theme='onedark'
endif
let g:airline_powerline_fonts=1



if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_left_sep = ''
" let g:airline_left_sep = ''
" let g:airline_left_sep = '|'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_right_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_sep = '|'
" let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = ' ␊:'
" let g:airline_symbols.linenr = ' ␤:'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = ' '
" let g:airline_symbols.maxlinenr = ' '
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
" let g:airline_left_sep = ''
let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
let g:airline_left_alt_sep = ''
" let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
" let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' :'
" let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty='⚡'

let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tmuxline#enabled = 1
" let g:airline#extensions#tmuxline#left_sep= ' '
" let g:airline#extensions#tmuxline#left_alt_sep = '|'
" let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_tab_count = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}




nnoremap <leader>bk :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>BK :bd!<CR>
nnoremap <leader>bK :bd!<CR>
nnoremap <leader>bB :ls<CR>
nnoremap <leader>BB :ls<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>fS :w<SPACE>
nnoremap <leader>FS :w 
nnoremap <leader>F<Esc> <Esc>
nnoremap <leader>f<Esc> <Esc>
nnoremap <leader>F<C-g> <Esc>
nnoremap <leader>qh :sh<CR>
nnoremap <leader>qq :qa<CR>
nnoremap <leader>qQ :qa!<CR>
nnoremap <leader>QQ :qa!<CR>
nnoremap <leader>q<Esc> <Esc>
nnoremap <leader>Q<Esc> <Esc>

" tab
nnoremap gh gT
nnoremap gl gt
nnoremap gn :tabe<CR>

" line end and home
noremap g- g_
noremap - g_



" open GVim
nnoremap <leader>GV :!gvim %<CR>

" brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O


" eval
nnoremap <leader>feR :source %<CR>
nnoremap <leader>fer :source %<CR>
nnoremap <leader>fee :e<CR>
nnoremap <leader>fe<Esc> <Esc>

"global directory settings
nnoremap <F2> :cd %:p:h<CR>:pwd<CR>
nnoremap <F1> :pwd<CR>


"python settings
nnoremap <C-c><C-m> :w<CR>:cd %:p:h<CR>:!python %<CR>
nnoremap <C-c><C-c> :w<CR>:!python %<CR>
nnoremap <C-c><Esc> <Esc>

" simple cpp compilation
nnoremap <C-c><C-p> :w <CR> :!g++ *.cpp -o %< -I. && ./%< <CR>


" GVim settings
noremap þ <Esc>þ
noremap! þ <Esc>þ
tnoremap þ <Esc>þ


noremap <F5> :Termdebug<CR>
noremap <F9> :Step<CR>
"noremap <C-F9> :Over<CR>
noremap <F10> :Over<CR>
noremap <F11> :Cont<CR>
"noremap <C-S-F9> :Cont<CR>
" noremap <F12> :Eval<CR>
noremap \ :Eval<CR>
