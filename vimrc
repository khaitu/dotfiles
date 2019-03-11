" Use Vim settings, rather then Vi settings (much better!).  " This must be first, because it changes other options as a side effect.  set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set visualbell
set autoread
set mouse=a
set ruler
set nofoldenable
set cursorline
set textwidth=100
set colorcolumn=+1
set hidden
set nowrap
set linebreak
set listchars=tab:→\ ,nbsp:␣,trail:· " ,space:·
set encoding=utf-8
set list
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set noswapfile
set nobackup
set nowb
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set splitright
set splitbelow
set background=dark

syntax on

" Change leader to a comma because the backslash is too far away
" let mapleader=","

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Completion
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/tmp/*

" Search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
" Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'xsunsmile/showmarks.git'
Plugin 'SearchComplete'
Plugin 'dsawardekar/ember.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rking/ag.vim'
Plugin 'dsawardekar/portkey'
Plugin 'kshenoy/vim-signature'
Plugin 'rhysd/conflict-marker.vim'

call vundle#end()
filetype plugin indent on

set termguicolors
set grepprg=ag\ --nogroup\ --nocolor
set sessionoptions-=globals
set sessionoptions-=localoptions
set sessionoptions-=options
set sessionoptions-=buffers
set sessionoptions-=resize

colorscheme base16-tomorrow-night

let g:ag_working_path_mode = 'r'
let g:airline_theme = 'base16'
let g:ale_list_window_size = 10
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '!!'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:polyglot_disabled = ['graphql']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:maplocalleader = ';'
let g:NERDTreeNodeDelimiter = "\u00a0"

highlight SyntaxError term=bold,underline cterm=bold,underline ctermfg=1 gui=bold,underline guifg=#cc6666
highlight SyntaxWarning term=bold,underline cterm=bold,underline ctermfg=1 gui=bold,underline guifg=#f0c674
highlight link ALEError SyntaxError
highlight link ALEWarning IncSearch
highlight link ALEErrorSign Error
highlight link ALEWarningSign IncSearch
highlight link ALEErrorLine SyntaxError
highlight link ALEWarningLine SyntaxWarning

augroup vimrc
  autocmd!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
  au BufNewFile,BufRead *.hbs set filetype=mustache
augroup END
