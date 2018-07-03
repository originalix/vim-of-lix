func! myspacevim#before() abort
    " 关闭相对行号显示
    let g:spacevim_relativenumber = 0
    " 开启YouCompleteMe
    let g:spacevim_enable_ycm = 1

    " 配置各个编程语言的缩进 代码格式
    "Tab键的宽度
    set smartindent
    set shiftwidth=4
    set tabstop=4

    "使用4个空格代替Tab
    set expandtab
    set softtabstop=4
    "Tab键插入四个空格,仅PHP
    autocmd FileType php set shiftwidth=4 tabstop=4 expandtab softtabstop=4

    " 设置mapleader
    let mapleader = ","
    let g:mapleader = ","

    " 配置vim-jsbeautify
    nnoremap <leader><c-f> :call JsBeautify()<CR>
    " or
    autocmd FileType javascript noremap <buffer> <leader><c-f> :call JsBeautify()<cr>
    " for json
    autocmd FileType json noremap <buffer> <leader><c-f> :call JsonBeautify()<cr>
    " for jsx
    autocmd FileType jsx noremap <buffer> <leader><c-f> :call JsxBeautify()<cr>
    " for html
    autocmd FileType html noremap <buffer> <leader><c-f> :call HtmlBeautify()<cr>
    " for css or scss
    autocmd FileType css noremap <buffer> <leader><c-f> :call CSSBeautify()<cr>
endf

