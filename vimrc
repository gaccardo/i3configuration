set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'python.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'tagbar'
Plugin 'fugitive.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
"
" StatusLine

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2

syntax on

" Key Mappings
nmap <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

""" EINS

" ## NAME: ~/.vimrc
" ## delete unwanted spaces for all the file
" ## :%s/\s\+$//
set nocompatible

" ## disable startup message
set shortmess+=I

set title
set ls=2
syntax on
set ruler
" ## set relativenumber

" ## show path= :set path?
" ## search down into subfolders
" ## Provides tab-completion for all file-related tasks
set path+=**
" ## Display all matching files when we tab complete
set wildmenu

colorscheme desert
set background=dark

set autoread      " auto refresh files
" ## enable full/long shell autocomplete functions for completing
" ## filenames
set wildmode=longest,list

set history=1000         " remember more commands and search history
set undolevels=1000      " use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set showmatch		" Show matching brackets.
" set ignorecase  " Do case insensitive matching
" set showcmd     " Show (partial) command in status line.
set hlsearch      " print coincidences
set noautoindent  " auto indent on
set tabstop=3     " tab are 3 spaces
set shiftwidth=3  " indent are 3 spaces
set nocindent     " indent on

set nobackup      " no backup files
set nowritebackup " disable backup file while editing
set noswapfile    " no swap files

" filetype plugin on
" filetype plugin indent on
filetype indent off

" ## shortcuts
" ## C is Ctrl ;; S is Shift
nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

"nmap <C-N> : set invnumber<CR>
"nmap <C-S-N> : set invrelativenumber<CR>
nmap <C-S-P> : set paste<CR>

" ## removing all unwanted spaces for all the file
nmap <silent> <leader>ss :%s/\s\+$//<CR>

" ##The <Leader> key is mapped to \ by default.
" ## This replaces :tabnew which I used to bind to this mapping
nmap <leader>ee :enew<cr>
" ## Move to the next buffer
nmap <leader>k :bnext<CR>
" ## Move to the previous buffer
nmap <leader>j :bprevious<CR>
" ## Close the current buffer and move to the previous one
" ## This replicates the idea of closing a tab
nmap <leader>b :bp <BAR> bd #<CR>
" ## Show all open buffers and their status
nmap <silent> <leader>l :ls<CR>

" ## moving between tabs
nmap <leader>t :tabnew<CR>
" ## move to the previous tab
nmap <silent> <leader>i :tabprevious<CR>
" ## move to the next tab
nmap <silent> <leader>o :tabnext<CR>
" ## close tab
nmap <silent> <leader>c :tabclose<CR>

" ## Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ## Tweaks for browsing
let g:netrw_banner=0 " disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view

" ## Format for the status line
hi StatusLine ctermbg=White ctermfg=DarkGray
" ## tabs
hi TabLineFill ctermfg=Black ctermbg=DarkGray
hi TabLine ctermfg=DarkRed ctermbg=Black
hi TabLineSel ctermfg=DarkRed ctermbg=Black

" ## Themes
let g:airline_theme="term"
