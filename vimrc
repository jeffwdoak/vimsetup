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

" Put temporary and backup files in the .vim directory 
set backupdir=/home/jdoak/.vim/tmp
set directory=/home/jdoak/.vim/tmp
set undodir=/home/jdoak/.vim/tmp

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
