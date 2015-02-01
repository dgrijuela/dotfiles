set nocompatible
filetype off

set t_Co=256
set mouse=a
syntax enable
set background=dark
colorscheme default

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

""""""""""""""""""""""""""""""""""""
" Beginning of plugins section
" Run :PluginInstall! to update them
""""""""""""""""""""""""""""""""""""

call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Snippet engine
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Collection of snippets
Plugin 'honza/vim-snippets'

" Status bar
Plugin 'itchyny/lightline.vim'

" Git in the line number column
Plugin 'airblade/vim-gitgutter'

" Autosave
Plugin 'vim-scripts/vim-auto-save'
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" Syntax checker
Plugin 'scrooloose/syntastic'
let g:sysntastic_check_on_open=1

" Autocompletion
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

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

" Rails
Plugin 'tpope/vim-rails'

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

" Fuzzy file finder
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
map <c-o> :CtrlPBuffer<CR>

call vundle#end()

""""""""""""""""""""""""
" End of plugins section
""""""""""""""""""""""""

filetype plugin indent on

" Fuck semicolon
nnoremap ; :

" Open current file in Google Chrome
nmap <silent> <leader>g :!google-chrome % &

" Highlight characters that go over 80 columns
highlight ColorColumn ctermbg=yellow
call matchadd('ColorColumn', '\%81v', 100)

" Use :w!! to write to a file using sudo if you forgot to open it that way
cmap w!! %!sudo tee > /dev/null %

" Syntastic configuration
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" .md is for Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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
