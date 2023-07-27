# [Vim](https://www.vim.org)


[Vim - the ubiquitous text editor](https://www.vim.org/)

[5 ways to level up your Vim skills](https://opensource.com/article/20/3/vim-skills)

[Classic SysAdmin: Vim 101: A Beginner’s Guide to Vim](https://www.linuxfoundation.org/blog/blog/classic-sysadmin-vim-101-a-beginners-guide-to-vim)

[0.Vimrc Configuration Guide - How to Customize Your Vim Code Editor with Mappings, Vimscript, Status Line, and More](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)

[1.Set up Vim as your Rust IDE](https://opensource.com/article/20/7/vim-rust-ide)

[2.Rust + vim + code completion](https://medium.com/rust-sections/rust-vim-code-completion-b6a36a177340)

[3.Configuring Vim for Rust development](https://blog.logrocket.com/configuring-vim-rust-development/)

---
## setup vim

### Setup Config Dir File:   /usr/share/vim   ~/.vimrc   ~/.vim/colors  ~/.vim/autoload


### [简明 VIM 练级攻略](https://coolshell.cn/articles/5426.html)

### [Vim 从入门到精通](https://github.com/wsdjeg/vim-galore-zh_cn)

### [Vim配置文件（.vimrc）](http://c.biancheng.net/view/3024.html)

---
## ColorScheme

#### [How to Change and Use Vim Color Schemes](https://phoenixnap.com/kb/vim-color-schemes)

#### [Awesome Vim Color Schemes](https://github.com/rafi/awesome-vim-colorschemes)

   ##### [Nord-Vim](https://github.com/arcticicestudio/nord-vim)

---
### Vim-Plug

#### [vim-plug: A beautiful and minimalist vim plugin manager for Linux/Unix users](https://www.cyberciti.biz/programming/vim-plug-a-beautiful-and-minimalist-vim-plugin-manager-for-unix-and-linux-users/)

#### [vim-plug](https://github.com/junegunn/vim-plug)

#### [ansible-vim plugin GitHub repo](https://github.com/pearofducks/ansible-vim)

---


#### [vim中文乱码 vim字符集设置](https://blog.51cto.com/niuben/3028731)

#### How to set tab to 4 spaces in vim?

   Make ~/.vimrc and add this:
   
    set tabstop=4
    
#### Here are some other helpful ones
```   
"==============================================================================
" vim 内置配置 
"==============================================================================

" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway. We set it explicitely to make our position clear!
" 关闭兼容模式
set nocompatible

"中文乱码vim字符集设置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set mouse=a
set selection=exclusive
set selectmode=mouse,key

set nu " 设置行号
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

set showmode

set laststatus=2         " Always show statusline.
set display=lastline     " Show as much as possible of the last line.

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释
set softtabstop=4
set smarttab " Autotabs for certain code
set smartindent

set ruler " Always shows location in file (line#)
set showmatch " Shows matching brackets
set number

inoremap jj <Esc>


"set termguicolors
"colorscheme meta5
set background=dark


" 定义快捷键的前缀，即<Leader>
let mapleader=";" 

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vmap <Leader>c "+yy
" n 模式下复制一行到系统剪切板
nmap <Leader>c "+yy
" n 模式下粘贴系统剪切板的内容
nmap <Leader>v "+p

" 开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
" syntax on " Syntax highlighting

filetype plugin indent on    " 启用自动补全

" 退出插入模式指定类型的文件自动保存
" au InsertLeave *.go,*.sh,*.php write


" 插件开始的位置
call plug#begin('~/.vim/plugged')

call plug#end()
    
    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>
```
    
[How to set tab to 4 spaces in vim?](https://superuser.com/questions/505937/how-to-set-tab-to-4-spaces-in-vim)
