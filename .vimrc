"--------------------------------------------"
" adc90's vimrc
"--------------------------------------------"

"--------------------------------------------"
" Set standard Vim settings
"--------------------------------------------"
set ttymouse=xterm2
set background=dark
set hidden
set hlsearch
set ignorecase
set incsearch
set magic
set number
set showmatch
set smartcase
set mouse=a
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

au InsertLeave *.html :BLReloadPage

"--------------------------------------------"

"--------------------------------------------"
" Colorscheme stuff
"--------------------------------------------"
colorscheme peaksea
highlight NonText guifg=fg guibg=bg ctermfg=fg ctermbg=bg gui=none cterm=none
set t_Co=256
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
if !1 | finish | endif

if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'


call neobundle#end()
filetype plugin indent on

NeoBundleCheck

"--------------------------------------------"
" Plugins
"--------------------------------------------"
" Bundle 'jaxbot/browserlink.vim'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'MattesGroeger/vim-bookmarks'
" Bundle 'Raimondi/delimitMate'
" Bundle 'Shougo/neocomplete.vim'
" Bundle 'Shougo/neosnippet.vim'
" Bundle 'Shougo/unite.vim'
" Bundle 'ZoomWin'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'ap/vim-css-color'
" Bundle 'bling/vim-airline'
" Bundle 'bling/vim-bufferline'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'docunext/closetag.vim'
" Bundle 'elzr/vim-json'
" Bundle 'ervandew/supertab'
" Bundle 'godlygeek/csapprox'
" Bundle 'godlygeek/tabular'
" Bundle 'hail2u/vim-css3-syntax'
" Bundle 'haya14busa/incsearch.vim'
" Bundle 'jlanzarotta/bufexplorer'
" Bundle 'junegunn/limelight.vim'
" Bundle 'majutsushi/tagbar'
" Bundle 'mattn/emmet-vim'
" Bundle 'mileszs/ack.vim'
" Bundle 'nice/sweater'
" Bundle 'osyo-manga/vim-over'
" Bundle 'othree/html5.vim'
" Bundle 'rdlugosz/vim-dragvisuals'
" Bundle 'rhysd/clever-f.vim'
" Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/syntastic'
" Bundle 'sjl/gundo.vim'
" Bundle 'tommcdo/vim-exchange'
" Bundle 'tomtom/tcomment_vim'
" Bundle 'tpope/vim-abolish'
" Bundle 'tpope/vim-capslock'
" Bundle 'tpope/vim-endwise'
" Bundle 'tpope/vim-eunuch'
" Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-git'
" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-markdown'
" Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-speeddating'
" Bundle 'triglav/vim-visual-increment'
" Bundle 'vim-coffee-script'
" Bundle 'vim-scripts/Colour-Sampler-Pack'
" Bundle 'vim-scripts/CycleColor'
" Bundle 'vim-scripts/YankRing.vim'
" Bundle 'vim-scripts/cascadia.vim'
" Bundle 'vimwiki/vimwiki'
" Bundle 'whatyouhide/vim-gotham'
" Bundle 'kopischke/unite-spell-suggest'
" Bundle 'kristijanhusak/vim-multiple-cursors'
"--------------------------------------------"

"--------------------------------------------"
" Plugin configurations
"--------------------------------------------"
"Vim-airline configuration
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
" let g:airline_powerline_fonts = 1
" " let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#syntastic#enabled =1
" set laststatus=2
" let g:airline_theme = "badwolf"
" 
" "Bookmarks
" "let g:bookmark_save_per_working_dir = 1
" 
" "Nerd Tree toggle
" let g:NERDTreeWinPos = "right"
" let g:tagbar_left = 1
" 
" "Incremental increase of alpha characters
" set nrformats=alpha
" 
" "OCaml Merlin configurations
" set rtp+=/usr/local/share/ocamlmerlin/vim
" 
" "CSS color preview
" let g:cssColorVimDoNotMessMyUpdatetime = 1
" 
" "Neocomplete configuration
" let g:acp_enableAtStartup = 0
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" 
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
" 
" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"
" " Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" 
" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" let g:unite_source_history_yank_enable = 1
" 
" " Called once right before you start selecting multiple cursors
" function! Multiple_cursors_before()
"     if exists(':NeoCompleteLock')==2
"         exe 'NeoCompleteLock'
"     endif
" endfunction
" 
" " Called once only when the multiple selection is canceled (default <Esc>)
" function! Multiple_cursors_after()
"     if exists(':NeoCompleteUnlock')==2
"         exe 'NeoCompleteUnlock'
"     endif
" endfunction
" 
" " Move visual block
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
" 
" "Syntastic
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_full_redraws = 1
" let g:syntastic_auto_jump = 2
" let g:syntastic_auto_loc_list = 1

"--------------------------------------------"
" call vundle#end()
" filetype plugin indent on
"--------------------------------------------"

"--------------------------------------------"
" Map leader
"--------------------------------------------"
"Set leader to space
let mapleader=" "

"Set leader bar short cuts
" map  <leader>b  :call ToggleSyntax()            <CR>
" map  <leader>cs :JumpToCSS                      <CR>
" map  <leader>g  :YRShow                         <CR>
" map  <leader>c  :setlocal spell!                <CR>
" map  <leader>d  :call ToggleLimeLight()         <CR>
" map  <leader>f  :Unite grep:.                   <CR>
" map  <leader>g  :Unite history/yank             <CR>
" map  <leader>j  i<CR><Esc>
" map  <leader>k  :Unite -quick-match buffer      <CR>
" map  <leader>l  :set list!                      <CR>
" map  <leader>o  :NERDTreeToggle                 <CR>
" map  <leader>p  :call StripTrailingWhitespace() <CR>
" map  <leader>r  :call ToggleNumber()            <CR>
" map  <leader>s  :Unite file_rec/async           <CR>
" map  <leader>t  :TagbarToggle                   <CR>
" map  <leader>u  :GundoToggle                    <CR>
" map  <leader>y  :call ShowColumn()              <CR>
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

" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
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

vmap <expr> <LEFT><LEFT> DVB_Drag('left') 
vmap <expr> <RIGHT><RIGHT> DVB_Drag('right')
vmap <expr> <DOWN><DOWN> DVB_Drag('down') 
vmap <expr> <UP><UP> DVB_Drag('up')

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

" let g:airline_theme_patch_func = 'AirlineThemePatch'
" function! AirlineThemePatch(palette)
"     if g:airline_theme == 'badwolf'
"         for colors in values(a:palette.inactive)
"             let colors[3] = 245
"         endfor
"     endif
" endfunction

" function! ToggleLimeLight()
"     Limelight!!
" endfunction
"----------------------------------"

