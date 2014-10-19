"--------------------------------------------"
" adc90's vimrc
"--------------------------------------------"

"--------------------------------------------"
" Set standard Vim settings
"--------------------------------------------"
set autowrite
set cursorline
set hidden
set hlsearch
set ignorecase
set incsearch
set number
set showcmd
set showmatch
set smartcase
set ttymouse=xterm2
set wildmenu
set background=dark
syntax sync minlines=256

"Customize the characters for new line and tab
set listchars=tab:▸\ ,eol:¬

"Tab configuration
set shiftwidth=4
set expandtab
set softtabstop=4

if has("syntax")
    syntax on
endif
"--------------------------------------------"

"--------------------------------------------"
" Colorscheme stuff
"--------------------------------------------"
set t_Co=256
colorscheme Mustang
"--------------------------------------------"

"--------------------------------------------"
" Set Vundle stuff
"--------------------------------------------"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"--------------------------------------------"
" Plugins
"--------------------------------------------"
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/vim-statline'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'triglav/vim-visual-increment'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'vim-scripts/CycleColor'
Plugin 'vim-scripts/cascadia.vim'
Plugin 'whatyouhide/vim-gotham'

"--------------------------------------------"
" Plugin configurations
"--------------------------------------------"
"Nerdtree configurations
let g:NERDTreeWinPos = "right"

"Incremental increase of alpha characters
set nrformats=alpha
"--------------------------------------------"
call vundle#end()
filetype plugin indent on
"--------------------------------------------"

"--------------------------------------------"
" Map leader
"--------------------------------------------"
"Set leader to space
let mapleader=" "

"Set leader bar short cuts
map <leader>b :call ToggleSyntax()            <CR>
map <leader>c :setlocal spell!                <CR>
map <leader>g :call ReverseBackground()       <CR>
map <leader>l :set list!                      <CR>
map <leader>o :NERDTreeToggle                 <CR>
map <leader>p :call StripTrailingWhitespace() <CR>
map <leader>r :call ToggleNumber()            <CR>
map <leader>t :TagbarToggle                   <CR>
map <leader>u :GundoToggle                    <CR>
map <leader>y :call ShowColumn()              <CR>
"--------------------------------------------"

"--------------------------------------------"
" Regular key remapings
"--------------------------------------------"
"Remap a H,D,L to behave more normally
noremap H ^
nnoremap D d$
noremap L $
vnoremap L g_

"Map C-e to eol for insert mode
"Map C-a to bol for insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
"----------------------------------"

"----------------------------------"
" Resizing the vim buffers using
" ctrl + [hjkl]
" eventually I would like to replace
" this with the arrow keys and use
" control + [hjkl] to move lines
"----------------------------------"
noremap <C-K> :resize -5<CR>
noremap <C-J> :resize +5<CR>
noremap <C-L> :vertical resize +5<CR>
noremap <C-H> :vertical resize -5<CR>
"----------------------------------"

"----------------------------------"
" Some functions I've picked up and
" wrote myself
"----------------------------------"
" Toggle relative numbers: http://dougblack.io/words/a-good-vimrc.html#colors
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function ShowColumn()
    if(&colorcolumn != 0)
        set colorcolumn=0
    else
        highlight ColorColumn ctermbg=red
        set colorcolumn=81
    endif
endfunction

function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction
"----------------------------------"

"----------------------------------"
" Plugins I might want later
"----------------------------------"
"Plugin 'Yggdroot/indentLine'
"Plugin 'jaxbot/browserlink.vim'
"Plugin 'mattn/emmet-vim'
"Plugin 'mileszs/ack.vim'
"Plugin 'oplatek/Conque-Shell'
"Plugin 'AndrewRadev/splitjoin.vim'
"Plugin 'lervag/vim-latex'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/neosnippet.vim'
