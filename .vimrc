set nocompatible              " required
filetype off                  " required
set modelines=0

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
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-sensible'
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'sheerun/vim-polyglot'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-multiple-cursors'



" Ultisnips settings
let g:UltiSnipsExpandTrigger="<F5>"
let g:UltiSnipsJumpForwardTrigger="<F6>"
let g:UltiSnipsJumpBackwardTrigger="<F7>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
" set hidden
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
let mapleader = ","
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

let python_highlight_all = 1
set wildmenu
set cursorline
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
nnoremap <leader>ss :Ag

let g:pymode_python = 'python3'
let g:auto_save = 0

" Press O to just add a line below.
map O o<ESC>

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
map <C-m> :MBEToggle<CR>

set pastetoggle=<F3> "Paste code without having an indentation-headache

highlight ALEWarning ctermbg=none cterm=none
highlight ALEError ctermbg=none cterm=underline
let g:ale_python_pylint_options = '--load-plugins pylint_django'

"Django specific mappings to jump between files
"let g:last_relative_dir = ''
"nnoremap \1 :call RelatedFile ("models.py")<cr>
"nnoremap \2 :call RelatedFile ("views.py")<cr>
"nnoremap \3 :call RelatedFile ("urls.py")<cr>
"nnoremap \4 :call RelatedFile ("admin.py")<cr>
"nnoremap \5 :call RelatedFile ("tests.py")<cr>
"nnoremap \6 :call RelatedFile ( "templates/" )<cr>
"nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
"nnoremap \8 :call RelatedFile ( "management/" )<cr>
"nnoremap \0 :e settings.py<cr>
"nnoremap \9 :e urls.py<cr>

"fun! RelatedFile(file)
    "#This is to check that the directory looks djangoish
    "if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        "exec "edit %:h/" . a:file
        "let g:last_relative_dir = expand("%:h") . '/'
        "return ''
    "endif
    "if g:last_relative_dir != ''
        "exec "edit " . g:last_relative_dir . a:file
        "return ''
    "endif
    "echo "Cant determine where relative file is : " . a:file
    "return ''
"endfun

"fun SetAppDir()
    "if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        "let g:last_relative_dir = expand("%:h") . '/'
        "return ''
    "endif
"endfun
"autocmd BufEnter *.py call SetAppDir()

"I'm a syntastic newbie
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1

let g:syntastic_python_pylint_args = "--load-plugins pylint_django" "To let syntastic know about django; make sure pip install pylint-django

" CtrlPsettings
set wildignore+=*/tmp/*,*.so,*.pyc,*.swp,*.zip,*/vendor/*,*/venv/*,*/env/*,*/\.git/*
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|vendor|env|venv'
let g:ctrlp_clear_cache_on_exit=1
