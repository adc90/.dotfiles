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
set listchars=tab:▸\ ,eol:·

"Tab configuration
set shiftwidth=4
set expandtab
set softtabstop=4

if has("syntax")
    syntax on
endif

"Set backup directories
set backup
set backupdir=~/.vim/backup
set backupdir=~/.vim/tmp

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

"--------------------------------------------"

"--------------------------------------------"
" Colorscheme stuff
"--------------------------------------------"
set t_Co=256
colorscheme wombat256
"--------------------------------------------"
" Favorites
"--------------------------------------------"
" synic,fu,Mustang,calmar256,mizore,peaksea,
" rootwater,softblue,solarized,sorcerer,tango,
" tesla,tir_black,torte,twilight,vimhut,wombat,
" xoria256,zendnb,zmrok,gotham256,adaryn,astroboy,
" asuldark,blacksea,brookstream,camo,candy,
" candycode,chocolateliqour,darkZ,dante,darkbone,
" darkburn,darkspectrum,dw_blue,dw_cyan,dw_green,
" dw_orange,dw_purple,dw_red,dw_yellow,ekvoli,
" fnaqevan,herald,jammy,jellybeans,lettuce,
" maroloccio,moss,northland,oceanblack,
" railscast,rdark,tango
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
"Plugin 'airblade/vim-gitgutter'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'klen/python-mode'
"Plugin 'scrooloose/nerdtree'
"Plugin 'skammer/vim-css-color'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/unite.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ap/vim-css-color'
Plugin 'docunext/closetag.vim'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'nice/sweater'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/vim-statline'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'triglav/vim-visual-increment'
Plugin 'vim-coffee-script'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'vim-scripts/CycleColor'
Plugin 'vim-scripts/cascadia.vim'
Plugin 'whatyouhide/vim-gotham'
"--------------------------------------------"
" Plugin configurations
"--------------------------------------------"

"Incremental increase of alpha characters
set nrformats=alpha

"OCaml Merlin configurations
set rtp+=/usr/local/share/ocamlmerlin/vim

"CSS color preview
let g:cssColorVimDoNotMessMyUpdatetime = 1

"Neocomplete configuration
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

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
map <leader>l :set list!                      <CR>
map <leader>o :Unite file buffer              <CR>
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

