set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
 
" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'

" Languages and markup
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<c-z>'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'

let g:indent_guides_guide_size = 1
Plugin 'nathanaelkane/vim-indent-guides'
map <silent><F7> <leader>ig

Plugin 'scrooloose/nerdtree'
map <c-n> :NERDTree<CR>

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
map <c-o> :CtrlPBuffer<CR>

call vundle#end()            " required

filetype plugin indent on " required!
syntax on

set completefunc=syntaxcomplete#Complete
set cursorline

set backspace=indent,eol,start
set iskeyword+=-

" Enable copying to clipboard using `CTRL + c`
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

set encoding=utf-8
set showcmd                     " display incomplete commands
 
"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
 
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
