"주의: Source Explorer의 충돌을 피하기 위해서 SrcExpl_pluginList를 새로 작성

"====================================================
"= BBundle
"====================================================
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'snipMate'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'DirDiff.vim'
Bundle 'https://github.com/wesleyche/SrcExpl.git'
"Bundle 'git://github.com/wesleyche/SrcExpl.git'
Bundle 'SuperTab'
Bundle 'cscope_macros.vim'
Bundle 'ronakg/quickr-cscope.vim'
Bundle 'gtags.vim'
Bundle 'OmniCppComplete'
Bundle 'armasm'
Bundle 'https://github.com/dhruvasagar/vim-table-mode.git'
"주석달기: \cc, \cn, \cs
"다른모양 주석 설정: \ca
"주석해제: \<space>
Bundle 'The-NERD-Commenter'
Bundle 'AutoComplPop'
"Bundle 'ShowMarks'
" Bundle 'mark'
Bundle 'octol/vim-cpp-enhanced-highlight'

"filetype plugin indent on     " required!

"====================================================
"= 어셈블리 파일을 C처럼 인식하여 주석을 달기 위한 트릭
"====================================================
au BufRead,BufNewFile *.S		set ft=c

"====================================================
"= 기본 설정
"====================================================
syntax on
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

colorscheme desert
" colorscheme industry
hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi PmenuSel cterm=NONE ctermfg=grey ctermbg=blue

set cursorline
" set colorcolumn=100
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap ,o :set cursorline! cursorcolumn!<CR>
nnoremap ,l :set cursorline!<CR>

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

"====================================================
"= gtags.vim 설정
"====================================================
let g:Gtags_No_Auto_Jump=1
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

"====================================================
"= 키맵핑
"====================================================
map <F1> :cs find g <C-R>=expand("<cword>") <CR><CR>
map <F2> :cs find c <C-R>=expand("<cword>") <CR><CR>
map <F3> :cs find s <C-R>=expand("<cword>") <CR><CR>
" <F4> 이전 정의로 이동 (SrcExpl 플러그인이 설정)
" <F5> 다음 정의로 이동 (SrcExpl 플러그인이 설정)
map <F6> :SrcExplToggle<CR>
map <F7> :TlistToggle<CR>
map <F8> :cp<cr>
map <F9> :cn<CR>

map <F10> :!cd /data/mctm_build/hlos/mctm_proc/att-manager&& ./updateTag.sh<CR>
" <F11> Full screen (Terminal program own)
" <F12> update srcExpl db(SrcExpl 플러그인이 설정)
map ,d :NERDTreeToggle<CR>
map ,f :NERDTreeFind<CR>
map ,b :BufExplorer<cr>
map ,c :copen<cr>

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

"===== tabview
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"===== gtags.vim
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
nmap <C-\><C-]> :GtagsCursor<CR>

"===== make
let startdir = getcwd()
func! Make()
	exe "!cd ".startdir
	exe "make"
endfunc
nmap ,mk :call Make()<cr><cr>

"===== hexViewer
let b:hexViewer = 0
func! Hv()
        if (b:hexViewer == 0)
                let b:hexViewer = 1
                exe "%!xxd"
        else
                let b:hexViewer = 0
                exe "%!xxd -r"
        endif
endfunc
nmap ,h :call Hv()<cr>

"===== man
func! Man()
	let sm = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>

"====================================================
"= Source Explorer config
"====================================================

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 10
" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
				\ "__Tag_List__",
				\ "NERD_tree_1",
				\ "Source_Explorer",
				\ "[BufExplorer]"
				\ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F4>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F4>"
" // Set "<F5>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F5>"




"====================================================
"= Tag List
"====================================================
filetype on"vim filetpye on
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=0
"window close=off
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1

"====================================================
"= Project config
"====================================================
if filereadable(".project.vimrc")
	source .project.vimrc
endif

"====================================================
"= NERD Tree
"====================================================
let NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=1


"====================================================
"= tags 설정 (cscope, ctags)
"====================================================

"Cscope의 상대경로 문제를 해결하기 위해서 매번 cscope.out파일을 새로 읽는다.
function! LoadCscope()
  exe "silent cs reset"
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

set cscopequickfix=s-,c-,d-,i-,t-,e-

"현재 디렉토리부터 root 디렉토리까지 tags를 찾는다.
set tags=./tags,tags;$HOME/
"set tags+=/data/mctm_build/hlos/apps_proc/poky/build/tmp-glibc/work/aarch64-poky-linux/dlt-daemon/2.15.0-r0/git/src/tags
set tags+=/data/gitClone/mctm/dlt-daemon/tags
set tags+=/data/gitClone/luna-service2/tags
set tags+=/data/gitClone/glib/tags
set tags+=/data/gitClone/mctm/persistence-client-library/tags
set tags+=/data/gitClone/mctm/node-state-manager/tags


"====================================================
"= Check Symbol
"====================================================
source ~/vimconfig/plugins/checksymbol.vim
