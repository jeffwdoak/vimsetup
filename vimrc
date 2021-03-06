set nocompatible
filetype off 

" Set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'


" Start list of plugins I want Vundle to manage

Plugin 'tpope/vim-fugitive'  " git commands in vim

Plugin 'tpope/vim-dadbod'  " database plugins

Plugin 'valloric/youcompleteme'  " autocomplete

Plugin 'altercation/vim-colors-solarized'  " Solarized color scheme for vim

Plugin 'scrooloose/nerdtree'  " Directory trees within vim

Plugin 'scrooloose/syntastic'

Plugin 'powerline/powerline', {'rtp' : 'powerline/bindings/vim'}  " upgraded status line
Plugin 'stephenmckinney/vim-solarized-powerline'  " solarized colorscheme for powerline

Plugin 'tmhedberg/SimpylFold'  " Code folding manager

Plugin 'othree/html5.vim'  " html5 formatting and autocomplete

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'TaskList.vim'

Plugin 'latex-box-team/latex-box'

Plugin 'jpalardy/vim-slime'

" All of your plugins must be added before the following line
call vundle#end()
filetype plugin indent on 

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Setup vim 

syntax enable
set number  " Turn on line numbering

set history=50  " Keep 50 lines of command line history
set ruler       " Show the cursor position all the time
set showcmd     " Display incomplete commands
set incsearch   " Do incremental searching
set hlsearch    " Highlight search results?

" Set vim colorscheme
set background=dark
colorscheme solarized

" powerline settings
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized16_dark'
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" NerdTree customization
let NerdTreeIgnore=['\.pyc$', '\~$']  " Ignore files in nerdtree

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"

" split naviation key remapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Turn on code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za  " enable folding w/ spacebar
let g:SimpylFold_docstring_preview = 1

" Configure html5 plugin




