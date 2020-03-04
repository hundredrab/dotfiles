set nocompatible              " required
"filetype off                  " required
set modelines=0

"for syntax highlighting
filetype plugin on
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'davidhalter/jedi-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin '907th/vim-auto-save'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fisadev/vim-isort'
Plugin 'tell-k/vim-autopep8'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive' "for git
" Plugin 'tweekmonster/impsort.vim'

Plugin 'MarcWeber/vim-addon-mw-utils' "snipmate dependency
Plugin 'tomtom/tlib_vim' "snipmate dependency
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-sensible'
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'sheerun/vim-polyglot'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'thiagoalessio/rainbow_levels.vim'

"For live html/css/js editing
Plugin 'turbio/bracey.vim'
Plugin 'tweekmonster/django-plus.vim'

" Flutter/Dart stuff
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jmcantrell/vim-virtualenv'

Plugin 'wmvanvliet/jupyter-vim'


Plugin 'arcticicestudio/nord-vim' "colorscheme: nord


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme nord

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233


" Ultisnips settings
let g:UltiSnipsExpandTrigger="<F5>"
let g:UltiSnipsJumpForwardTrigger="<F6>"
let g:UltiSnipsJumpBackwardTrigger="<F7>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent
" All of these from http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set undofile
set relativenumber
set visualbell
set ttyfast
set ruler
set hidden
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
let mapleader = ","
let maplocalleader = "["
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set colorcolumn=81
highlight ColorColumn ctermbg=Black
nnoremap ; :
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Do import sorts, autopep8, and fold HTML tags, respectively.
nnoremap <leader>i :Isort<cr>
nnoremap <leader>a :Autopep8<cr>ZZ
nnoremap <leader>ft Vatzf

"let python_highlight_all = 1
set wildmenu
set cursorline

let g:pymode_python = 'python3'
let g:auto_save = 1

let g:jedi#force_py_version=3
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2

"YCM related:
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
" let g:ycm_register_as_syntastic_checker = 0 " Faster vim?
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

map <C-t> :NERDTreeToggle<CR>

set pastetoggle=<F3> "Paste code without having an indentation-headache

highlight ALEWarning ctermbg=none cterm=none
highlight ALEError ctermbg=none cterm=underline
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_dart_dartfmt_executable = '/usr/lib/dart/bin/dartfmt'
let g:ale_fixers = {
\   'python': ['autopep8', 'black', 'isort', 'yapf'],
\   'dart': ['dartfmt'],
\}

"let g:ale_virtualenv_dir_names = ['env']



" CtrlPsettings
set wildignore+=*/tmp/*,*.so,*.pyc,*.swp,*.zip,*/vendor/*,*/venv/*,*/env/*,*/\.git/*
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|vendor|env|venv'
let g:ctrlp_clear_cache_on_exit=1


au BufRead,BufNewFile *.dart set filetype=dart
au BufRead,BufNewFile *.dart set sw=2 ts=2
au BufRead,BufNewFile *.html set sw=2 ts=2
au BufRead,BufNewFile *.css set sw=2 ts=2
au BufRead,BufNewFile *.js set sw=2 ts=2

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
nnoremap <leader>ff :!flutter format %<cr>

"Diff colors
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse


"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    exec(open('env/bin/activate_this.py').read(), {'__file__': 'env/bin/activate_this.py'})
EOF

"jupyter
nnoremap <leader>x :JupyterSendCell<CR>

