set nocompatible
filetype off

" Run :PluginInstall! to update

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Molokai theme
Plugin 'tomasr/molokai'

" Snippet engine
Plugin 'SirVer/ultisnips'
let g:UltiSnipsListSnippets="<c-s>"
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Collection of snippets
Plugin 'honza/vim-snippets'

" Status bar
Plugin 'bling/vim-airline'

" Git in the line number column
Plugin 'airblade/vim-gitgutter'
highlight clear SignColumn

" Autosave
Plugin 'vim-scripts/vim-auto-save'
let g:auto_save = 1

" Syntax checker
Plugin 'scrooloose/syntastic'
let g:sysntastic_check_on_open=1

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" List of undos
Plugin 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" Git inside Vim
Plugin 'tpope/vim-fugitive'

" Search and replace across many files
Plugin 'skwp/greplace.vim'

" HTML and CSS autocompletion
Plugin 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key = '<c-e>'

" JavaScript
Plugin 'pangloss/vim-javascript'

" Support for other languages
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elzr/vim-json' " Distinct highlighting for keys and values

" Automatic closing quote, bracket, or whatever
Plugin 'Raimondi/delimitMate'

" Change surrounds
Plugin 'tpope/vim-surround' " cs\"' without the \ to change double quotes for single

" Show indent lines
let g:indent_guides_guide_size = 1
Plugin 'nathanaelkane/vim-indent-guides'
map <silent><F7> <leader>ig

" File tree
Plugin 'scrooloose/nerdtree'
map <c-n> :NERDTree<CR>

" Fuzzy file finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
map <c-o> :CtrlPBuffer<CR>

call vundle#end()

filetype plugin indent on

" Open current file in Google Chrome
nmap <silent> <leader>g :!google-chrome % &

" Highlight characters that go over 80 columns
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

" Use :w!! to write to a file using sudo if you forgot to open it that way
cmap w!! %!sudo tee > /dev/null %

" Enable copying to clipboard using `CTRL + c`
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

" Close NERDTree when exiting
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" .md is for Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
hi! DiffAdd      guibg=#003300
hi! DiffChange   guibg=#003300
hi! DiffDelete   guifg=#330000 guibg=#330000
hi! DiffText     guibg=#990000    

" Display settings
set t_Co=256
syntax enable
set background=dark
colorscheme molokai

set completefunc=syntaxcomplete#Complete
set cursorline
set backspace=indent,eol,start
set iskeyword+=-
set laststatus=2
set encoding=utf-8
set showcmd                     " display incomplete commands
set number                      " display line number
set wildignore=*.o,*.obj,*.bak,*.exe

" System settings
set nobackup
set nowritebackup
set noswapfile
set confirm                     " dialog when :w or :q fails
set hidden                      " remember undo after quitting
set history=50                  " keep 50 lines of command history

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2
set shiftwidth=2                " a tab is two spaces (or set this to 4)
set shiftround                  " indent to the nearest tabstop
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
