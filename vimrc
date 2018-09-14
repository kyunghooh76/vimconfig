"주의: Source Explorer의 충돌을 피하기 위해서 SrcExpl_pluginList를 새로 작성
"
""====================================================
"= BBundle
""====================================================
" :BundleList          - list configured bundles
" " :BundleInstall(!)    - install(update) bundles
" " :BundleSearch(!) foo - search(or refresh cache first) for foo
" " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" "
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Bundle command are not allowed..
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!

Bundle 'VundleVim/Vundle.vim'
Bundle 'The-NERD-tree'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'gtags.vim'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'AutoComplPop'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'Valloric/YouCompleteMe'
Bundle 'Valloric/YouCompleteMe'
" Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-smooth-scroll'

filetype plugin indent on

set nocompatible
set autoindent
set cindent			"들여쓰기 설정
set smartindent
set ruler			" 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set number			" 줄번호 출력
set modifiable
set hlsearch			" Highlight Search
set ignorecase      " ignore case sensitive when searching
set ts=4			" tab stop - tab 크기
set sw=4			" shift width - shift 크기 조절
set sts=4			" soft tab stop - tab 이동 크기
set expandtab
set incsearch
set printoptions=portrait:n,wrap:n,duplex:off
set encoding=utf8
set fileencodings=utf-8,euc-kr
set gfn=나눔고딕코딩\ 12	" gvim용 폰트 설정
set virtualedit=all
set mouse=a
set backspace=indent,eol,start
" set dir=~/.vim_tmp		" .swp file directory
set nobackup
set noswapfile

"syntax enable
"set background=dark
"colorscheme solarized

" let g:airline_theme='luna'

colorscheme desert
" colorscheme industry
hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi PmenuSel cterm=NONE ctermfg=grey ctermbg=blue

set cursorline
" set colorcolumn=100
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap ,o :set cursorline! cursorcolumn!<CR>

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              "              | | | | |  |   |      |  |     |    + current
"              "              | | | | |  |   |      |  |     |       column
"              "              | | | | |  |   |      |  |     +-- current line
"              "              | | | | |  |   |      |  +-- current % into file
"              "              | | | | |  |   |      +-- current syntax in
"              "              | | | | |  |   |          square brackets
"              "              | | | | |  |   +-- current fileformat
"              "              | | | | |  +-- number of lines
"              "              | | | | +-- preview flag in square brackets
"              "              | | | +-- help flag in square brackets
"              "              | | +-- readonly flag in square brackets
"              "              | +-- rodified flag in square brackets
"              "              +-- full path to file in the Buffer

"==========================
"= autocmd
"==========================
"autocmd BufEnter *.c        setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter *.S        setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter *.py       setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter Makefile   setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter .*         setlocal ts=8 sw=8 sts=8 noexpandtab nocindent
autocmd BufEnter *.md       setlocal ts=8 sw=8 sts=8 noexpandtab nocindent
autocmd BufEnter *.sh       setlocal ts=8 sw=8 sts=8 noexpandtab nocindent
autocmd BufWritePre * :%s/\s\+$//e	" remove trailing whitespace

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let mapleader=","

nnoremap <Leader>b :BufExplorer<CR>
nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>c :copen<cr>
nnoremap <Leader>cc :cclose<cr>

"=====  PageUP PageDown
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"===== Vim 내의 창 크기 조절
nmap <s-h> <C-W><
nmap <s-j> <C-W>-
nmap <s-k> <C-W>+
nmap <s-l> <C-W>>

"===== Vim 내에서 창 간 이동
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap <c-0> <c-w>v
nmap <c-9> <c-w>s

nmap <c-s> :w<CR>

"===== tabview
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"===== 버퍼간 이동
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer

map ,1 :b!1<CR>	  " Switch to File Buffer #1
map ,2 :b!2<CR>	  " Switch to File Buffer #2
map ,3 :b!3<CR>	  " Switch to File Buffer #3
map ,4 :b!4<CR>	  " Switch to File Buffer #4
map ,5 :b!5<CR>	  " Switch to File Buffer #5
map ,6 :b!6<CR>	  " Switch to File Buffer #6
map ,7 :b!7<CR>	  " Switch to File Buffer #7
map ,8 :b!8<CR>	  " Switch to File Buffer #8
map ,9 :b!9<CR>	  " Switch to File Buffer #9
map ,0 :b!0<CR>	  " Switch to File Buffer #0

"===== gtags.vim
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
nmap <C-\><C-]> :GtagsCursor<CR>

"====================================================
"= NERD Tree
"====================================================
let NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=1

"====================================================
"= MiniBufExplorer
"====================================================
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"====================================================
"= gtags.vim 설정
"====================================================
let g:Gtags_No_Auto_Jump=0
let g:Gtags_Auto_Update=1
let g:Gtags_OpenQuickfixWindow=0
",gd 입력. 현재 cursor가 위치한 string을 tag에서 검색(definition등)
nmap <Leader>gd :Gtags <C-R>=expand("<cword>")<CR><CR>
",gr 입력. 현재 cursor가 위치한 string으로 reference검색.사용하는 곳의 위치를 보여줌.
nmap <Leader>gr :Gtags -r <C-R>=expand("<cword>")<CR><CR>
",gs 입력. 현재 cursor가 위치한 string으로 symbol 검색.(variable등)
nmap <Leader>gs :Gtags -s <C-R>=expand("<cword>")<CR><CR>
",gg 입력, --grep pattern 검색, 모든 파일에서 검색, (h, c, txt 등)
nmap <Leader>gg :Gtags -go <C-R>=expand("<cword>")<CR><CR>
",gp 입력, 파일명 검색
nmap <Leader>gp :Gtags -Po <C-R>=expand("<cword>")<CR><CR>
",ge 입력, --regexp 검색.
nmap <Leader>ge :Gtags -ge <C-R>=expand("<cword>")<CR><CR>

" 위의 사용법과 동일하며, case sensitivity를 ignore
nmap <Leader>igd :Gtags -i <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>igr :Gtags -ir <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>igs :Gtags -is <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>igg :Gtags -igo <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>igp :Gtags -iPo <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ige :Gtags -ige <C-R>=expand("<cword>")<CR><CR>

"위의 사용법과 동일하며, 한가지 차이점은 위의 명령은 현재 커서 위치의 string으로 검색
"아래 명령은 검색하려는 string을 직접 입력함
nmap <Leader>ld :Gtags
nmap <Leader>lr :Gtags -r
nmap <Leader>ls :Gtags -s
nmap <Leader>lg :Gtags -go
nmap <Leader>lp :Gtags -Po
nmap <Leader>le :Gtags -ge

nmap <Leader>ild :Gtags -i
nmap <Leader>ilr :Gtags -ir
nmap <Leader>ils :Gtags -is
nmap <Leader>ilg :Gtags -igo
nmap <Leader>ilp :Gtags -iPo
nmap <Leader>ile :Gtags -ige

"현재 디렉토리부터 root 디렉토리까지 tags를 찾는다.
set tags=./tags,tags;$HOME/
set tags+=/data/gitClone/linux-4.18.6/tags
set tags+=/data/gitClone/mctm/dlt-daemon/tags
set tags+=/data/gitClone/luna-service2/tags
set tags+=/data/gitClone/glib/tags
set tags+=/data/gitClone/mctm/persistence-client-library/tags
set tags+=/data/gitClone/mctm/node-state-manager/tags
"YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"To avoid conflict snippets
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 0
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_show_diagnostics_ui = 0

nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>ygg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>yd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>
nnoremap <leader>yp :YcmCompleter GetParent<CR>

" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>
