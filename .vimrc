set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree' 
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'godlygeek/tabular'
Plugin 'frazrepo/vim-rainbow'
Plugin 'tpope/vim-surround'
Plugin 'my-plugin'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let mapleader = ";"

set backspace=indent,eol,start
set mouse=c
set number
set nowrap
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set t_Co=256
set encoding=utf-8
set langmenu=zh_CN.UTF-8

syntax on
colorscheme Chasing_Logic

nnoremap fw :w<cr>
nnoremap fq :q<cr>
nnoremap fwq :wq<cr>

nnoremap J :bp<cr>
nnoremap K :bn<cr>
nnoremap <leader>w <c-w>w
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>1 :b 1<cr>
nnoremap <leader>2 :b 2<cr>
nnoremap <leader>3 :b 3<cr>
nnoremap <leader>4 :b 4<cr>
nnoremap <leader>5 :b 5<cr>
nnoremap <leader>6 :b 6<cr>
nnoremap <leader>7 :b 7<cr>
nnoremap <leader>8 :b 8<cr>
nnoremap <leader>9 :b 9<cr>

nnoremap yw viw"+y
nnoremap y "+y
vnoremap <c-c> "+y

nnoremap <c-u> viwU
vnoremap <c-u> iwUv
inoremap <c-u> <esc>viwUi
nnoremap <c-l> viwu
vnoremap <c-l> iwuv
inoremap <c-l> <esc>viwui

nnoremap <leader>< i&lt;<esc>
nnoremap <leader>> i&gt;<esc>
inoremap <leader>< &lt;
inoremap <leader>> &gt;

" JSON 格式化
vnoremap <leader>J :'<,'>!python -m json.tool<cr>

" 编译运行
nnoremap <f5> :call CompileAndRun()<cr>
function! CompileAndRun()
	execute "w"
	if &filetype == 'c'
		execute "!g++ % -o %<"
		execute "!time ./%<"
	elseif &filetype == 'cpp'
		execute "!g++ % -o %<"
		execute "!time ./%<"
    elseif &filetype == 'sh'
		execute "!time zsh %"
    elseif &filetype == 'python'
        execute "!time python3 %"
	endif
endfunction


" nerdtree
nnoremap <f3> :NERDTreeToggle<cr>
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 40
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeHidden = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" nerdcommenter
let g:NERDSpaceDelims = 1


" markdown-preview
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
" 如果设置了该参数, g:mkdp_browserfunc 将被忽略
let g:mkdp_path_to_chrome = ""

" vim 回调函数, 参数为要打开的 url
let g:mkdp_browserfunc = 'MKDP_browserfunc_default'

" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次
let g:mkdp_auto_start = 1

" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预览窗口
let g:mkdp_auto_open = 1

" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不自动关闭预览窗口
let g:mkdp_auto_close = 1

" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时更新预览
let g:mkdp_refresh_slow = 1

" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown 文件可以使用改命令
let g:mkdp_command_for_global = 0

" 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
" 默认只监听本地（127.0.0.1），其他计算机不能访问
let g:mkdp_open_to_the_world = 0


" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '


" tabular
nnoremap <leader>\| :Tab /\|<cr>
vnoremap <leader>\| :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>
vnoremap <leader>= :Tab /=<cr>
nnoremap <leader>\ :Tab /\<cr>
vnoremap <leader>\ :Tab /\<cr>


" vim-rainbow
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
