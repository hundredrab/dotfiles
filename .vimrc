set nocompatible              " required
set encoding=utf-8
"filetype off                  " required
set modelines=0

"for syntax highlighting
filetype plugin on
syntax on
set background=dark

call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug '907th/vim-auto-save'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'ycm-core/YouCompleteMe'
Plug 'jmcantrell/vim-virtualenv'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'fisadev/vim-isort', { 'for': ['python', 'django'] }
Plug 'tell-k/vim-autopep8', { 'for': ['python', 'django'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'MarcWeber/vim-addon-mw-utils' "snipmate dependency
Plug 'tomtom/tlib_vim' "snipmate dependency
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'sheerun/vim-polyglot'
"Plug 'fholgado/minibufexpl.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'chrisbra/DynamicSigns'
Plug 'thiagoalessio/rainbow_levels.vim'

Plug 'tweekmonster/django-plus.vim', { 'for': ['htmldjango', 'python', 'django']}

" Flutter/Dart stuff
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'thosakwe/vim-flutter', { 'for': 'dart' }

Plug 'nathanaelkane/vim-indent-guides', { 'for': ['dart', 'html', 'css', 'js', 'ts'] }
Plug 'wmvanvliet/jupyter-vim'


"Plug 'arcticicestudio/nord-vim' "colorscheme: nord
"Plug 'zxqfl/tabnine-vim' "TabNine.com

Plug 'editorconfig/editorconfig-vim' "Editorconfig for phoenix
"Plug 'ggandor/vim-srt-sync' "For subtitles


" For zettlekasten
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'

 Plug 'pangloss/vim-javascript'    " JavaScript support
 Plug 'leafgarland/typescript-vim' " TypeScript syntax
 Plug 'Quramy/tsuquyomi', { 'on': 'TsuImport' }
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }


call plug#end()            " required
filetype plugin indent on

"colorscheme nord

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233


" Ultisnips settings
let g:UltiSnipsExpandTrigger="<F5>"
let g:UltiSnipsJumpForwardTrigger="<F6>"
let g:UltiSnipsJumpBackwardTrigger="<F7>"
let g:snipMate = { 'snippet_version' : 1 }

" If you want :UltiSnipsEdit to split your window.
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all = 1
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:UltiSnipsEditSplit="vertical"


syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent
"All of these stolen from http://stevelosh.com/blog/2010/09/coming-home-to-vim/
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
set smarttab
set hlsearch
let mapleader = ","
let maplocalleader = "["
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
"nnoremap ; :
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Do import sorts, autopep8, and fold HTML tags, respectively.
nnoremap <leader>i :Isort<cr>
nnoremap <leader>a :ALEFix<cr>
":Autopep8<cr>ZZ
nnoremap <leader>ft Vatzf
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

"let python_highlight_all = 1
set wildmenu

let g:pymode_python = 'python3'
let g:auto_save = 1 "Uncomment to enable autosave. just use :wa instead

let g:jedi#force_py_version=3
let g:jedi#completions_enabled = 0
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2

map <C-t> :NERDTreeToggle<CR>

set pastetoggle=<F3> "Paste code without having an indentation-headache

highlight ALEWarning ctermbg=none cterm=none
highlight ALEError ctermbg=none cterm=underline
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_dart_dartfmt_executable = '/usr/lib/dart/bin/dartfmt'
let g:ale_linters = {
\   'python': ['flake8', 'black', 'pylint'],
\   'typescript': ['eslint'],
\}
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'dart': ['dartfmt'],
\   'typescript': ['eslint'],
\   'html': ['tidy'],
\}
", 'prettier', 'tslint', 'xo',

"let g:ale_virtualenv_dir_names = ['env']
let g:virtualenv_auto_activate = 1



" CtrlPsettings
set wildignore+=*/tmp/*,*.so,*.pyc,*.swp,*.zip,*/vendor/*,*/venv/*,*/env/*,*/\.git/*
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|vendor\|env\|venv\|node_modules'
let g:ctrlp_clear_cache_on_exit=1

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


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

"Diff colors for better view in git diffs (used w/ git-fugitive)
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse

"EditorConfig settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"detect ts files
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \   if &omnifunc == "" |
              \           setlocal omnifunc=syntaxcomplete#Complete |
              \   endif
endif


"for jupyter qtconsole
nnoremap <leader>x :JupyterSendCell<CR>

"vimwiki // zettelkasten for note taking
let g:vimwiki_list = [{'path':'~/scratchbox/vimwiki/markdown/','ext':'.md','syntax':'markdown', 'path_html': '~/scratchbox/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown'}, {"path":"~/scratchbox/vimwiki/wiki/"}]
let g:zettel_format = "%y%m%d-%H%M"
let g:zettel_options = [{"template" :  "~/scratchbox/vimwiki/zettle_template.tpl"}]
nnoremap /tod "=strftime("%b %d %Y")<CR>P
inoremap /tod <ESC>"=strftime("%b %d %Y")<CR>P
nnoremap <leader>o :ZettelOpen<CR>

"zebra coloring
let g:Signs_Alternate = 1

"Following to unbreak 8.2; see: https://www.reddit.com/r/vim/comments/gv410k/strange_character_since_last_update_42m/
let &t_TI = ""
let &t_TE = ""

"Run the command on current line on the shell and pipe back the output
nnoremap  Q !!$SHELL<CR>

nnoremap <leader>q :norm I'<Esc>A',<Esc>

"Keep working dir clean, create swp, ~, un~ in .vim or /tmp
"set backupdir=~/.vim/,/tmp//
"set directory=~/.vim/,/tmp//
"set undodir=~/.vim/,/tmp//
