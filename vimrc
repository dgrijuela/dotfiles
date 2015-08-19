" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

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
Plugin 'scrooloose/syntastic'
let g:sysntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = "~/.rvm/rubies/ruby-2.2.0/bin/ruby" "~/.rvm/gems/ruby-2.2.0/bin/rubocop"

" List of undos
Plugin 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>

" Highlight whitespace
Plugin 'ntpeters/vim-better-whitespace'

" Git inside Vim
Plugin 'tpope/vim-fugitive'

" Search and replace across many files
Plugin 'skwp/greplace.vim'

" HTML and CSS autocompletion
Plugin 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key = '<c-e>'

" Multiple select
Plugin 'terryma/vim-multiple-cursors'

" Make . repeat plugins maps
Plugin 'tpope/vim-repeat'

" Highlight not proper words
Plugin 'nicholaides/words-to-avoid.vim'

" See what you are pasting
Plugin 'junegunn/vim-peekaboo'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
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
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
let coffee_linter = '/usr/local/lib/node_modules/coffeelint/bin/coffeelint'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" Move between vim panes and tmux splits
Plugin 'christoomey/vim-tmux-navigator'

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
syntax on
set regexpengine=1
colorscheme default
let mapleader=","
highlight Search ctermfg=black
