## setup vim

### Setup Config Dir File:   /usr/share/vim   ~/.vimrc   ~/.vim/colors  ~/.vim/autoload


### [简明 VIM 练级攻略](https://coolshell.cn/articles/5426.html)

---
### ColorScheme

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

    "中文乱码vim字符集设置
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8

    set mouse=a
    set showmode

    inoremap jj <Esc>

    set tabstop=4
    set softtabstop=4
    set number

    set showmatch " Shows matching brackets
    set ruler " Always shows location in file (line#)
    set smarttab " Autotabs for certain code
    set shiftwidth=4

    set autoindent
    set smartindent

    set termguicolors
    colorscheme nord
    set background=dark

    syntax on " Syntax highlighting

    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>



[How to set tab to 4 spaces in vim?](https://superuser.com/questions/505937/how-to-set-tab-to-4-spaces-in-vim)
