"fix annoying match brace hilighting colors
hi MatchParen cterm=NONE ctermbg=cyan ctermfg=black    


filetype plugin on
set omnifunc=syntaxcomplete#Complete

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


