"fix annoying match brace hilighting colors
hi MatchParen cterm=NONE ctermbg=cyan ctermfg=black    


set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'nvie/vim-flake8' "PEP-8
Plugin 'vim-syntastic/syntastic' "check syntax on save

Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'tmhedberg/SimpylFold' "folding
 
Plugin 'jnurmine/Zenburn' " color theme

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set omnifunc=syntaxcomplete#Complete

"matlab block matching
source $VIMRUNTIME/macros/matchit.vim 
" Octave syntax 
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 


"*****************OCTAVE / MATLAB ***********************
" Use keywords from Octave syntax language file for autocomplete 
if has("autocmd") && exists("+omnifunc") 
   autocmd Filetype octave 
   \	if &omnifunc == "" | 
   \	 setlocal omnifunc=syntaxcomplete#Complete | 
   \	endif 
endif 
"matlab comment to 'c
let @c=":.,'cs/^/%/"


set autoindent
set shiftwidth=4
set tabstop=4
set tags=./tags;src
set relativenumber
"http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"macros
"switch order of alphanumeric words around a comma,
"start macro at 1st letter of second word
let @s='dwbbPa,wwx'

"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python stuff

set encoding=utf-8

let python_highlight_all=1
syntax on

au BufNewFile, BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

"au BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
"start NERDTree automatically
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
" close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
