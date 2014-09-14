" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"--------------------------------------------"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"--------------------------------------------"
" Plugins 
"--------------------------------------------"
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
"Plugin 'kien/ctrlp.vim' "Removed in favor of unite.vim
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/CycleColor'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/unite.vim'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
"--------------------------------------------"
" Plugin configurations
"--------------------------------------------"
let g:indent_guides_guide_size = 4
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_soft_pattern = ' '
"--------------------------------------------"
call vundle#end()
filetype plugin indent on
"--------------------------------------------"
color delek
set number

"Set leader to space
let mapleader=" "

"Set leader bar short cuts
map <leader>o :NERDTreeToggle<CR>
map <leader>t :TagbarToggle<CR>
map <leader>y :YRShow<CR>

"Set mappings for unite stuff
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

