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
set iskeyword+=-
set iskeyword+=/
" set background=dark

syntax on

let mapleader = ","
let g:maplocalleader =  ";"

inoremap jk <esc>
vnoremap jk <esc>
vnoremap <leader>" :Commentary<cr>
nnoremap <leader>c :noh<cr>
nnoremap <leader>d Y$p
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>tm :tabmove<cr>
nnoremap <leader>tn :tabnew<cr> :tabmove<cr>
nnoremap [<space> O<esc>
nnoremap ]<space> o<esc>
nnoremap ]<cr> i<cr><esc>
nnoremap <C-P> :FZF<cr>
nnoremap <C-F> :Ag<Space>
nnoremap ∆ :move .+1<cr>
nnoremap ˚ :move .-2<cr>
nnoremap <leader>nt :NERDTree<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

" Auto indent pasted text
nnoremap <leader>p p=`]<C-o>
nnoremap <leader>P P=`]<C-o>

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

" FZF
set rtp+=/usr/local/opt/fzf

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sgur/vim-editorconfig'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'luochen1990/rainbow'
Plugin 'SearchComplete'
Plugin 'dsawardekar/portkey'
Plugin 'kshenoy/vim-signature'
Plugin 'rhysd/conflict-marker.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'vim-scripts/cmdalias.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'junegunn/goyo.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-rails'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on

set termguicolors
set grepprg=ag\ --nogroup\ --nocolor
set sessionoptions-=globals
set sessionoptions-=localoptions
set sessionoptions-=options
set sessionoptions-=buffers
set sessionoptions-=resize
set formatoptions-=ro
set formatoptions+=j

colorscheme base16-tomorrow-night

let g:ag_working_path_mode = 'r'
let g:ag_prg="ag --nobreak --column --nogroup --noheading"
let g:airline_theme = 'base16_tomorrow'
let g:airline_section_b = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:ale_list_window_size = 10
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '!!'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_linters= { 'html': [] }
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:goyo_width = 102
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:maplocalleader = ';'
let g:NERDTreeWinSize = 40
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.git/*','tmp/*','.DS_Store','node_modules/*','bower_components/*']
let g:polyglot_disabled = ['graphql']
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'ctermfgs': ['brown', 'darkblue', 'darkgray', 'darkgreen', 'darkcyan', 'darkred', 'darkmagenta', 'brown', 'gray', 'black', 'darkmagenta', 'darkblue', 'darkgreen', 'darkcyan', 'darkred', 'red'],
\   'guifgs': ['royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3', 'royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3', 'royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3', 'royalblue3', 'seagreen3', 'darkorchid3', 'firebrick3'],
\   'separately': {'*': {}, 'html': 0, 'handlebars': 0}
\ }
let g:vim_json_syntax_conceal = 0

highlight SyntaxError term=bold,underline cterm=bold,underline ctermfg=1 gui=bold,underline guifg=#cc6666
highlight SyntaxWarning term=bold,underline cterm=bold,underline ctermfg=1 gui=bold,underline guifg=#f0c674
highlight IndentGuidesEven ctermbg=235
highlight link ALEError SyntaxError
highlight link ALEWarning IncSearch
highlight link ALEErrorSign Error
highlight link ALEWarningSign IncSearch
highlight link ALEErrorLine SyntaxError
highlight link ALEWarningLine SyntaxWarning

function! g:DisableMatchParen ()
  if exists(":NoMatchParen")
    :NoMatchParen
  endif
endfunction

augroup vimrc
  autocmd!
  au BufNewFile,BufRead *.handlebars,*.hbs set filetype=html.handlebars syntax=handlebars
  au BufNewFile,BufRead *.scss set filetype=sass syntax=sass
  au BufNewFile,BufRead *.slim set filetype=slim syntax=slim
  au VimEnter * call DisableMatchParen()
  au BufWritePre * %s/\s\+$//e
augroup END

function! Wipeout()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

