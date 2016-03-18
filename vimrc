" set up Pathogen first
filetype off
execute pathogen#infect()
call pathogen#helptags()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch

" Tell viminfo to remember things when we exit
" '10  : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20  : up to 20 lines of command-line history will be remembered
" %    : saves and restores the buffer list
" n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Function to go to the last cursor location when I open a file
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

" Put temporary and backup files in the .vim directory 
set backupdir=/home/xxxx/.vim/tmp
set directory=/home/xxxx/.vim/tmp
set undodir=/home/xxxx/.vim/tmp

" set code folding "
set foldmethod=indent
set foldlevel=99

" task lists mapping
map <leader>td <Plug>TaskList

" gundo mapping
map <leader>g :GundoToggle<CR>

" pyflakes settings
let g:pyflakes_use_quickfix = 0

" python pep8 mapping
let g:pep8_map='<leader>8'

" supertab tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:SuperTabNoCompleteAfter=['^',',','\s']

" Fugitive git integration
set statusline+=%{fugitive#statusline()}

" Filetype syntax highlighting "
syntax on
filetype on
filetype plugin indent on

" Solarized settings "
set background=dark
colorscheme solarized

set number
