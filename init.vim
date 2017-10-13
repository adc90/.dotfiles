"-------------------------------------"
" adc90's vim configuration
"-------------------------------------"

"-------------------------------------"
" Standard vim settings
"-------------------------------------"
set hidden
set hlsearch
set ignorecase
set incsearch
set magic
set number
set showmatch
set smartcase
set mouse=a
set backspace=indent,eol,start
syntax sync minlines=256

"Customize the characters for new line and tab
set listchars=tab:▸\ ,eol:·

"Tab configuration
set shiftwidth=4
set expandtab
set softtabstop=4

if has("syntax")
    syntax on
endif

"Set backup directories
set nobackup
set nowb
set noswapfile

"Auto-commands
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    endif
endif

hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END
hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
"-------------------------------------"


"--------------------------------------------"
" Set Vim plug stuff
"--------------------------------------------"

call plug#begin('~/.vim/plugged')

"--------------------------------------------"
" Plugins
"--------------------------------------------"
"Plug 'whatyouhide/vim-gotham'
"Plug 'jaxbot/browserlink.vim'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'MattesGroeger/vim-bookmarks'
"Plug 'ZoomWin'
"Plug 'altercation/vim-colors-solarized'
"Plug 'ap/vim-css-color'
"Plug 'bling/vim-airline'
"Plug 'bling/vim-bufferline'
"Plug 'davidhalter/jedi-vim'
"Plug 'docunext/closetag.vim'
"Plug 'elzr/vim-json'
"Plug 'ervandew/supertab'
"Plug 'godlygeek/csapprox'
"Plug 'godlygeek/tabular'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'haya14busa/incsearch.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'majutsushi/tagbar'
"Plug 'mattn/emmet-vim'
"Plug 'mileszs/ack.vim'
"Plug 'nice/sweater'
"Plug 'osyo-manga/vim-over'
"Plug 'othree/html5.vim'
"Plug 'rdlugosz/vim-dragvisuals'
"Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
"Plug 'sjl/gundo.vim'
"Plug 'tommcdo/vim-exchange'
"Plug 'tomtom/tcomment_vim'
"Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-capslock'
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-eunuch'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-git'
"Plug 'tpope/vim-haml'
"Plug 'tpope/vim-markdown'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-speeddating'
"Plug 'triglav/vim-visual-increment'
"Plug 'vim-coffee-script'
Plug 'vim-scripts/Colour-Sampler-Pack'
Plug 'vim-scripts/CycleColor'
"Plug 'vim-scripts/YankRing.vim'
"Plug 'vim-scripts/cascadia.vim'
"Plug 'vimwiki/vimwiki'
"Plug 'kopischke/unite-spell-suggest'
"Plug 'kristijanhusak/vim-multiple-cursors'
"Plug 'Yggdroot/indentLine'
"--------------------------------------------"

call plug#end()

filetype plugin indent on

"--------------------------------------------"

"--------------------------------------------"
" Map leader
"--------------------------------------------"
"Set leader to space
let mapleader=" "
"Set leader bar short cuts
map <leader>b :call ToggleSyntax()            <CR>
map <leader>g :YRShow                         <CR>
map <leader>c :setlocal spell!                <CR>
map <leader>d :call ToggleLimeLight()         <CR>
map <leader>j i                               <CR> <Esc>
map <leader>l :set list!                      <CR>
map <leader>o :NERDTreeToggle                 <CR>
map <leader>p :call StripTrailingWhitespace() <CR>
map <leader>r :call ToggleNumber()            <CR>
map <leader>s :w                              <CR>
map <leader>t :TagbarToggle                   <CR>
map <leader>y :call ShowColumn()              <CR>
map <leader>a :call ToggleLimeLight()         <CR>
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
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
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

"Toggle relative numbers: http://dougblack.io/words/a-good-vimrc.html#colors
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! ShowColumn()
    if(&colorcolumn != 0)
        set colorcolumn=0
    else
        highlight ColorColumn ctermbg=red
        set colorcolumn=81
    endif
endfunction

function! StripTrailingWhitespace()
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

function! ToggleLimeLight()
    Limelight!!
endfunction
"-------------------------------------"

"-------------------------------------"
" Colorscheme stuff
"-------------------------------------"
color Mustang
highlight NonText guifg=fg guibg=bg ctermfg=fg ctermbg=bg gui=none cterm=none
set t_Co=256
"-------------------------------------"

