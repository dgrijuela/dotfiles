" Set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim

filetype off

""""""""""""""""""""""""""""""""""""
" Beginning of plugins section
" Run :PluginInstall! to update them
""""""""""""""""""""""""""""""""""""

call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Snippet engine
Plugin 'SirVer/ultisnips'

" Autocompletion
Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

" YouCompleteMe and UltiSnips compatibility, with the help of supertab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" Collection of snippets
Plugin 'honza/vim-snippets'

" Status bar
Plugin 'itchyny/lightline.vim'

" File tree
Plugin 'scrooloose/nerdtree'
nnoremap <leader>a :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close it when exiting main
let NERDTreeQuitOnOpen=1

" Git in the line number column
Plugin 'airblade/vim-gitgutter'

" Syntax checker
Plugin 'benekastah/neomake'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 1
let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact', '--config', '~/.eslintrc.json'],
    \ 'errorformat': '%f: line %l\, col %c\, %m'
    \ }
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
"autocmd! BufWritePost * Neomake

" List of undos
Plugin 'simnalamburt/vim-mundo'
nnoremap <F5> :MundoToggle<CR>
set undofile
set undodir=~/.vim/undo

" Highlight whitespace
Plugin 'ntpeters/vim-better-whitespace'

" Search and replace across many files
Plugin 'skwp/greplace.vim'

" HTML and CSS autocompletion
Plugin 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key = '<c-e>'

" Multiple select
Plugin 'terryma/vim-multiple-cursors'

" JavaScript
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Clojure
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Support for other languages
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" Automatic closing quote, bracket, or whatever
Plugin 'Raimondi/delimitMate'

" Align lines from character chosen
Plugin 'godlygeek/tabular' " :Tab /: to align all semicolons

" Change surrounds
Plugin 'tpope/vim-surround' " cs'<p> to change single quote surrounds for <p>

" Auto increment numbers and dates in visual block
Plugin 'VisIncr'

" Display TODO from different opened files.
Plugin 'TaskList.vim'
map <Leader>to <Plug>TaskList

" Markdown preview
Plugin 'shime/vim-livedown'
nmap gm :LivedownPreview<CR>

" Show indent lines
Plugin 'Yggdroot/indentLine'

" Fuzzy file finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore "node_modules"
      \ -g ""'
map <c-o> :CtrlPBuffer<CR>

call vundle#end()

""""""""""""""""""""""""
" End of plugins section
""""""""""""""""""""""""

filetype plugin indent on

" Terminal mode remaps
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" For splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open current file in Google Chrome
nmap <silent> <leader>g :!google-chrome % &

" Highlight characters that go over 80 columns
highlight ColorColumn ctermbg=yellow
call matchadd('ColorColumn', '\%81v', 100)

" Use :w!! to write to a file using sudo if you forgot to open it that way
cmap w!! %!sudo tee > /dev/null %

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

".md & .md.erb is for Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.md.erb set filetype=markdown

".es6 is for JS
autocmd BufNewFile,BufReadPost *.es6 set filetype=javascript
autocmd BufNewFile,BufReadPost *.es6.erb set filetype=javascript

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" This is for :Gdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" This is for GitGutter
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
highlight clear SignColumn

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Display settings
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
set matchpairs+=<:>

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

set pastetoggle=<F3>
set nocompatible
set t_Co=256
set mouse=a
set synmaxcol=350               " Syntax coloring lines that are too long just slows down the world
syntax on
set regexpengine=1
colorscheme default
let mapleader=","
highlight Search ctermfg=black
