" Vim-Plug 插件列表
call plug#begin()
Plug 'scrooloose/nerdtree'
" FZF 搜索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Lint 工具
Plug 'dense-analysis/ale'

" 代码提示
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" 代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 自动补全括号
Plug 'jiangmiao/auto-pairs'

" JS 支持
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'herringtondarkholme/yats.vim'
" HTML 支持
Plug 'othree/html5.vim'
" JSX 高亮
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
" JSX 格式化
Plug 'maxmellon/vim-jsx-pretty'
" LSP 支持
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" 主题插件
Plug 'mhartington/oceanic-next'

call plug#end()

" NERDTree 配置
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"  Always show dot files
let NERDTreeShowHidden=0
" 打开文件后，退出 NERDTree
let NERDTreeQuitOnOpen=0
map  <Leader>n  :NERDTreeFind<CR>

" ALE Lint 插件配置
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
let g:ale_fix_on_save = 1

" 自动补全配置
let g:deoplete#enable_at_startup = 1
" smart case不解释
let g:deoplete#enable_smart_case = 1
" 用户输入至少两个字符时再开始提示补全
call deoplete#custom#source('LanguageClient',
  \ 'min_pattern_length',
  \ 2)
" 字符串中不补全
call deoplete#custom#source('_',
  \ 'disabled_syntaxes', ['String']
  \)
" 补全结束或离开插入模式时，关闭预览窗口
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" 为每个语言定义completion source
" 是的vim script和zsh script都有，这就是deoplete
call deoplete#custom#option('sources', {
  \ 'cpp': ['LanguageClient'],
  \ 'c': ['LanguageClient'],
  \ 'vim': ['vim'],
  \ 'zsh': ['zsh']
\})
" 忽略一些没意思的completion source。
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']

" JSX 配置
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

" 前端代码格式化配置
" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
au FileType less setlocal formatprg=prettier\ --parser\ css

"LSP 支持
set hidden
" 为语言指定Language server和server的参数
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>

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
set shiftwidth=2
set tabstop=2

"使用4个空格代替Tab
set expandtab
set softtabstop=2
"Tab键插入四个空格,仅PHP
autocmd FileType php set shiftwidth=4 tabstop=4 expandtab softtabstop=4
" 不同的文件显示不同的缩进
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype vue setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype jsx setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype scss setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype less setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype wxml setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype wxss setlocal ts=2 sw=2 sts=0 noexpandtab
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

if (has("termguicolors"))
  set termguicolors
endif

colorscheme OceanicNext
