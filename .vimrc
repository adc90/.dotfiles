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
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/CycleColor'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'jaxbot/browserlink.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'oplatek/Conque-Shell'
"--------------------------------------------"
" Plugin configurations
"--------------------------------------------"
"
"--------------------------------------------"
call vundle#end()
filetype plugin indent on
"--------------------------------------------"


"--------------------------------------------"
" Colorscheme stuff
"--------------------------------------------"
" Favorite color shemes 
"--------------------------------------------"
" xoria256,Mustang
"--------------------------------------------"
set t_Co=256
colorscheme xoria256
"--------------------------------------------"

"Set leader to space
let mapleader=" "

"Set leader bar short cuts
map <leader>o :NERDTreeToggle<CR>
map <leader>t :TagbarToggle<CR>
map <leader>y :YRShow<CR>
map <leader>r :call ToggleNumber()<CR>
map <leader>s :update<CR>

"Make 'D' behave like 'Y'
nnoremap D d$

"Make H and L go to the begining and end of the line
noremap H ^
noremap L $
vnoremap L g_

"Avoid the <esc> key
imap jj <Esc>

"Status line
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"Tab configuration
set shiftwidth=4
set expandtab       
set softtabstop=4

"Misc configurations
set cursorline
set wildmenu
set showmatch
set hlsearch

" Toggle relative numbers: http://dougblack.io/words/a-good-vimrc.html#colors
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc


"------------------------------------
" Some functions from Damian Conway
"------------------------------------
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>

" EITHER blink the line containing the match...
function! HLNext (blinktime)
        set invcursorline
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        set invcursorline
        redraw
endfunction

" OR ELSE ring the match in red...
function! HLNext (blinktime)
        highlight RedOnRed ctermfg=red ctermbg=red
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        echo matchlen
        let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
                \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
                \ . '\|'
                \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
                \ . '\|'
                \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
        let ring = matchadd('RedOnRed', ring_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
endfunction

" OR ELSE briefly hide everything except the match...
function! HLNext (blinktime)
        highlight BlackOnBlack ctermfg=black ctermbg=black
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let hide_pat = '\%<'.lnum.'l.'
                \ . '\|'
                \ . '\%'.lnum.'l\%<'.col.'v.'
                \ . '\|'
                \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
                \ . '\|'
                \ . '\%>'.lnum.'l.'
        let ring = matchadd('BlackOnBlack', hide_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
endfunction

" OR ELSE just highlight the match in red...
function! HLNext (blinktime)
        highlight WhiteOnRed ctermfg=red ctermbg=white
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#'.@/
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
endfunction



