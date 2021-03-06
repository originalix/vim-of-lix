" Vundle 配置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" 文件分支树 NERDTree
Plugin 'scrooloose/nerdtree'
" 搜索文件 ctrlP
Plugin 'kien/ctrlp.vim'
" html5 插件
Plugin 'othree/html5.vim'
" Emmet 插件
Plugin 'mattn/emmet-vim'
"代码补全
" Plugin 'Shougo/neocomplcache'
"代码段自动生成
Plugin 'SirVer/ultisnips'
" jedi-vim
Plugin 'davidhalter/jedi-vim'
" 代码块合集
Plugin 'honza/vim-snippets'
" 多重光标选取插件
Plugin 'terryma/vim-multiple-cursors'
" vim-commentary 注释
Plugin 'tpope/vim-commentary'
" Html 自动闭合html标签
Plugin 'alvan/vim-closetag'
" 自动匹配html标签
Plugin 'Valloric/MatchTagAlways'
" CSS语法高亮
Plugin 'hail2u/vim-css3-syntax'
" CSS颜色预览插件
Plugin 'ap/vim-css-color'
" 自动补全后大括号
Plugin 'jiangmiao/auto-pairs'
" JavaScript语法高亮
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
" 明显显示javascript缩进
Plugin 'nathanaelkane/vim-indent-guides'
" 代码风格检查
Plugin 'scrooloose/syntastic'
" Markdown 插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" git集成
Plugin 'airblade/vim-gitgutter'
" AirLine 插件
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 自动缩进插件
Plugin 'vim-scripts/indentpython.vim'
" PEP8代码风格检查
Plugin 'nvie/vim-flake8'
" 微信小程序插件
Plugin 'chemzqm/wxapp.vim'
" 代码补全 Youcompleteme
Plugin 'Valloric/YouCompleteMe'
" javascript 补全
Plugin 'marijnh/tern_for_vim'
" taglist
Plugin 'vim-scripts/taglist.vim'
" 注释插件
Plugin 'scrooloose/nerdcommenter'
" 自动选择主题插件
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
" 主题配色
Plugin 'dracula/vim'
Plugin 'rafi/awesome-vim-colorschemes'
" Markdown 相关 语法高亮

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundle配置结束

" mapLeader
let mapleader = ','
let g:mapleader = ","

" NERDTree 配置
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"CtrlP 配置
"设置ctrlp的快捷方式 ctrp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"设置ctrlp的窗口位置
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
"在vim 命令下cd 切换目录,可以实现ctrlp 切换目录,下面两条命令
let g:NERDTreeChDirMode = 2
let g:ctrlp_working_path_mode = 'rw'

"---NeoComplCache 启动并使用Tab触发
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" vim-multiple-cursors 多光标配置
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim-commentary 注释配置
"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s

" vim-javascript 高亮js中的css和html
let javascript_enable_domhtmlcss = 1

" Syntastic 代码风格检查配置
" 设置错误符号
let g:syntastic_error_symbol='✗'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'
" 是否在打开文件时检查
let g:syntastic_check_on_open=0
" 是否在保存文件后检查
let g:syntastic_check_on_wq=1

" Vim-airline 配置
let g:airline_theme="molokai" 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

 "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
 nnoremap <C-tab> :bn<CR>
 nnoremap <C-s-tab> :bp<CR>
 " 关闭状态显示空白符号计数
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'
 " 设置consolas字体"前面已经设置过
 "set guifont=Consolas\ for\ Powerline\ FixedD:h11
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " old vim-powerline symbols
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'

" 分割布局 Split layouts设置
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ------------------常规配置----------------------
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set ai                  " auto indenting
set ruler               " show the cursor position
set hlsearch            " highlight the last searched term
set history=1000        " keep 1000 lines of history
syntax on               " syntax highlighting
filetype plugin on      " use the file type plugins
set nu!

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"禁用VI兼容模式 
set nocompatible     

"Vim 的内部编码
set encoding=utf-8         

"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
set termencoding=utf-8          

"Vim 当前编辑的文件在存储时的编码
set fileencoding=utf-8     

"Vim 打开文件时的尝试使用的编码
set fileencodings=ucs-bom,utf-8,gbk,default,latin1 

"设置中文帮助
set helplang=cn

"禁止生成临时文件
set nobackup

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set incsearch

"行内替换
set gdefault

"始终显示行号
set number

"显示光标的坐标
set ruler

"高亮整行
set cursorline

"自动缩进
set autoindent
set cindent
set smartindent

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"使用4个空格代替Tab
set expandtab
set softtabstop=4
"Tab键插入四个空格,仅PHP
autocmd FileType php set shiftwidth=4 tabstop=4 expandtab softtabstop=4
" 不同的文件显示不同的缩进
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype wxml setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype wxss setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype vue setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype wxss setlocal ts=2 sw=2 sts=0 noexpandtab

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"设置中文提示
language messages zh_CN.utf-8
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
"设置光标高亮，并显示坐标
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
colorscheme desert

" 针对Python的配置
au BufNewFile,BufRead *.py
\ set tabstop=4|
\ set softtabstop=4|
\ set shiftwidth=4|
\ set textwidth=79|
\ set expandtab|
\ set autoindent|
\ set fileformat=unix

" 针对HTML CSS JS的配置
" au BufNewFile,BufRead *.js, *.html, *.css
" \ set tabstop=2
" \ | set softtabstop=w
" \ | set shiftwidth=w

au BufNewFile,BufRead *.html, *.css, *.js
    \ set tabstop=2 softtabstop=2 shiftwidth=2

" 标示不必要的空白字符
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/
" python代码高亮
let python_highlight_all=1
" 系统剪贴板
set clipboard=unnamed

" emmet-vim的微信小程序配置
let g:user_emmet_settings = {
\ 'wxss': {
\   'extends': 'css',
\ },
\ 'wxml': {
\   'extends': 'html',
\   'aliases': {
\     'div': 'view',
\     'span': 'text',
\   },
\  'default_attributes': {
\     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
\     'navigator': [{'url': '', 'redirect': 'false'}],
\     'scroll-view': [{'bindscroll': ''}],
\     'swiper': [{'autoplay': 'false', 'current': '0'}],
\     'icon': [{'type': 'success', 'size': '23'}],
\     'progress': [{'precent': '0'}],
\     'button': [{'size': 'default'}],
\     'checkbox-group': [{'bindchange': ''}],
\     'checkbox': [{'value': '', 'checked': ''}],
\     'form': [{'bindsubmit': ''}],
\     'input': [{'type': 'text'}],
\     'label': [{'for': ''}],
\     'picker': [{'bindchange': ''}],
\     'radio-group': [{'bindchange': ''}],
\     'radio': [{'checked': ''}],
\     'switch': [{'checked': ''}],
\     'slider': [{'value': ''}],
\     'action-sheet': [{'bindchange': ''}],
\     'modal': [{'title': ''}],
\     'loading': [{'bindchange': ''}],
\     'toast': [{'duration': '1500'}],
\     'audio': [{'src': ''}],
\     'video': [{'src': ''}],
\     'image': [{'src': '', 'mode': 'scaleToFill'}],
\   }
\ },
\}

" YouComplete Me 配置
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 触发语义补全
let g:ycm_key_invoke_completion = '<c-z>'
" 屏蔽函数原型浏览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 关闭语义诊断信息
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
	\ 'cs,lua,javascript': ['re!\w{2}'],
    \ 'css,scss': [ 're!^\s{2,4}', 're!:\s+' ],
    \ }
" 在以下几种格式文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'nerdtree' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1
    \}
" 跳转到函数定义处
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 设置vim启动后自动打开taglist
let Tlist_Auto_Open = 1
" 让taglist窗口出现在Vim的右边
let Tlist_Use_Right_Window = 1
" 当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_File_Fold_Auto_Close = 1
" 只显示一个文件中的tag，默认为显示多个
let Tlist_Show_One_File = 1
" Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_Sort_Type ='name'
" Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_GainFocus_On_ToggleOpen = 1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" 设置窗体宽度为32，可以根据自己喜好设置
let Tlist_WinWidth = 32
" 这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" 热键设置，我设置成Leader+t来呼出和关闭Taglist
map t :TlistToggle<CR>

" NerdTreeCommenter 插件配置
" 在注释行后添加一个空格
let g:NERDSpaceDelims = 1
" 使用紧凑型语法来美化多行注释
let g:NERDCompactSexyComs = 1
" 添加自定义格式注释
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" 随机选择颜色
nnoremap <leader>rdc :RandomColorScheme<CR>
autocmd VimEnter * :RandomColorScheme

